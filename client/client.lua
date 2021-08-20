QBCore = nil
local _wheel = nil
local timeout = false
local closestBank = nil
local PlayerGender = "male"
local _lambo = nil
local _isShowCar = false
local _wheelPos = vector3(1111.052, 229.84, -50.38)
local _baseWheelPos = vector3(951.41, 63.77, 74.99)
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
local _isRolling = false

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

CheckGender = function()
    local hashSkinMale = GetHashKey("mp_m_freemode_01")
    local hashSkinFemale = GetHashKey("mp_f_freemode_01")
  
    if GetEntityModel(PlayerPedId()) == hashSkinMale then
      PlayerGender = "Man"
    elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
      PlayerGender = "Woman"
    end
    DebugPrint("Set gender as = ("..PlayerGender..")")
  end
  
    -- if ESX.IsPlayerLoaded() then
        local model = GetHashKey('vw_prop_vw_luckywheel_02a')

        Citizen.CreateThread(function()
            -- Wheel
            RequestModel(model)

            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end

            _wheel = CreateObject(model, 1111.052, 229.84, -50.38, false, false, true)
            SetEntityHeading(_wheel, 0.0)
            SetModelAsNoLongerNeeded(model)
        end)

RegisterNetEvent("luckywheel:doRoll")
AddEventHandler("luckywheel:doRoll", function(_prizeIndex) 
    _isRolling = true
    SetEntityHeading(_wheel, 0.9754)
    Citizen.CreateThread(function()
        local speedIntCnt = 1
        local rollspeed = 1.0
        local _winAngle = (_prizeIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 8)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0

                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 10
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
            SetEntityHeading(_wheel, 0.9754)
            SetEntityRotation(_wheel, 0.0, _y, 0.9754, 2, true)
            Citizen.Wait(0)
        end
    end)
end)

RegisterNetEvent("luckywheel:doMoneyRoll")
AddEventHandler("luckywheel:doMoneyRoll", function(_prizeIndex) 
    _isRolling = true
    SetEntityHeading(_wheel, 0.9754)
    Citizen.CreateThread(function()
        local speedIntCnt = 1
        local rollspeed = 1.0
        local _winAngle = (_prizeIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 8)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0

                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 10
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
            SetEntityHeading(_wheel, 0.9754)
            SetEntityRotation(_wheel, 0.0, _y, 0.9754, 2, true)
            Citizen.Wait(0)
        end
    end)
end)

RegisterNetEvent("luckywheel:rollFinished")
AddEventHandler("luckywheel:rollFinished", function() 
    if _isRolling then
    _isRolling = false
    -- QBCore.Functions.Notify("TEST2!", "success")
    end
end)

function doRoll()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
    if not _isRolling then
            if result then
                TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                QBCore.Functions.Notify("You have spun the wheel!", "success")
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        local lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        local anim = 'enter_right_to_baseidle'
        -- if IsPedMale(playerPed) then
            -- _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        -- end
        RequestAnimDict(lib)
            local _movePos = vector3(1110.20, 229.00, -49.64)
            --[[ local _movepos = vector3(1111.052, 229.84, -50.38) ]]
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  360.0,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            -- while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
                    Citizen.Wait(0)
                    -- DisableAllControlActions(0)
            -- end
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            -- while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
                Citizen.Wait(0)
                -- DisableAllControlActions(0)
            -- end
            TriggerServerEvent("luckywheel:getLucky")
            TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
    end
end
end, 'daily_ticket')
end

function doMoneyRoll()
    if not _isRolling then
        QBCore.Functions.Notify("You have spun the wheel!", "success")
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        local lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        local anim = 'enter_right_to_baseidle'
        -- if IsPedMale(playerPed) then
            -- _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        -- end
        RequestAnimDict(lib)
            local _movePos = vector3(1110.20, 229.00, -49.64)
            --[[ local _movepos = vector3(1111.052, 229.84, -50.38) ]]
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  360.0,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            -- while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
                    Citizen.Wait(0)
                    -- DisableAllControlActions(0)
            -- end
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            -- while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
                Citizen.Wait(0)
                -- DisableAllControlActions(0)
            -- end
            TriggerServerEvent("luckywheel:getMoneyLucky")
            TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
    end
end

function doTurboRoll()
    if not _isRolling then
        QBCore.Functions.Notify("You have spun the wheel!", "success")
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        local lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        local anim = 'enter_right_to_baseidle'
        RequestAnimDict(lib)
            local _movePos = vector3(1110.20, 229.00, -49.64)
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  360.0,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                Citizen.Wait(0)
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
                Citizen.Wait(0)
            TriggerServerEvent("luckywheel:getLucky")
            TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
    end
end

RegisterNetEvent("casino:luckyticket")
AddEventHandler("casino:luckyticket", function()
    local coords = GetEntityCoords(PlayerPedId())
    if (GetDistanceBetweenCoords(coords, 1111.052, 229.84, -50.38, true) < 2.5) then
        doRoll()
    end
end)

RegisterNetEvent("casino:spinwheel")
AddEventHandler("casino:spinwheel", function()
    local coords = GetEntityCoords(PlayerPedId())
    if (GetDistanceBetweenCoords(coords, 1111.052, 229.84, -50.38, true) < 2.5) then
        doMoneyRoll()
    end
end)

RegisterNetEvent("casino:turbowheel")
AddEventHandler("casino:turbowheel", function()
    local coords = GetEntityCoords(PlayerPedId())
    if (GetDistanceBetweenCoords(coords, 1111.052, 229.84, -50.38, true) < 2.5) then
        doTurboRoll()
    end
end)

RegisterNetEvent("luckywheel:winCar")
AddEventHandler("luckywheel:winCar", function()
    local plate = GetVehicleNumberPlateText(veh)
    local props = QBCore.Functions.GetVehicleProperties(veh)

    QBCore.Functions.SpawnVehicle("quadravtech", function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        SetEntityHeading(veh, QB.SpawnPunt.h)
        QBCore.Functions.Notify("Congratulations on your new Quadra V-Tech!", "success")
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        Citizen.Wait(500)
        TriggerEvent("qb-admin:client:SaveCar")
    end, QB.SpawnPunt, true)
end)

RegisterNetEvent("luckywheel:winCar2")
AddEventHandler("luckywheel:winCar2", function()
    local plate = GetVehicleNumberPlateText(veh)
    local props = QBCore.Functions.GetVehicleProperties(veh)

    QBCore.Functions.SpawnVehicle("rcf", function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        SetEntityHeading(veh, QB.SpawnPunt.h)
        QBCore.Functions.Notify("Congratulations on your new vehicle!", "success")
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        Citizen.Wait(500)
        TriggerEvent("qb-admin:client:SaveCar")
    end, QB.SpawnPunt, true)
end)