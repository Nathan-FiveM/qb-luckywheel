QBCore = nil
local timeOut = false
isRoll = false
amount = 50000
SpawnPunt = {x = -59.18, y = -1109.71, z = 25.45, h = 68.5}

local NumberCharset = {}

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('luckywheel:getLucky')
AddEventHandler('luckywheel:getLucky', function()
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    local bankamount = Player.PlayerData.money["cash"]
    if not isRoll then
        if Player ~= nil then
            if bankamount >= 0 then
                Player.Functions.RemoveItem('daily_ticket', 1)
                isRoll = true
                local _randomPrice = math.random(1, 100)
                if _randomPrice == 1 then
                    -- Win car
                    local _subRan = math.random(1,1000)
                    if _subRan <= 1 then
                        _priceIndex = 19
                    else
                        _priceIndex = 3
                    end
                elseif _randomPrice > 1 and _randomPrice <= 6 then
                    -- Win skin AK Gold
                    _priceIndex = 12
                    local _subRan = math.random(1,20)
                    if _subRan <= 2 then
                        _priceIndex = 12
                    else
                        _priceIndex = 7
                    end
                elseif _randomPrice > 6 and _randomPrice <= 15 then
                    -- Black money
                    -- 4, 8, 11, 16
                    local _sRan = math.random(1, 4)
                    if _sRan == 1 then
                        _priceIndex = 4
                    elseif _sRan == 2 then
                        _priceIndex = 8
                    elseif _sRan == 3 then
                        _priceIndex = 11
                    else
                        _priceIndex = 16
                    end
                elseif _randomPrice > 15 and _randomPrice <= 25 then
                    -- Win 300,000$
                    -- _priceIndex = 5
                    local _subRan = math.random(1,20)
                    if _subRan <= 2 then
                        _priceIndex = 5
                    else
                        _priceIndex = 20
                    end
                elseif _randomPrice > 25 and _randomPrice <= 40 then
                    -- 1, 9, 13, 17
                    local _sRan = math.random(1, 4)
                    if _sRan == 1 then
                        _priceIndex = 1
                    elseif _sRan == 2 then
                        _priceIndex = 9
                    elseif _sRan == 3 then
                        _priceIndex = 13
                    else
                        _priceIndex = 17
                    end
                elseif _randomPrice > 40 and _randomPrice <= 60 then
                    local _itemList = {}
                    _itemList[1] = 2
                    _itemList[2] = 6
                    _itemList[3] = 10
                    _itemList[4] = 14
                    _itemList[5] = 18
                    _priceIndex = _itemList[math.random(1, 5)]
                elseif _randomPrice > 60 and _randomPrice <= 100 then
                    local _itemList = {}
                    _itemList[1] = 3
                    _itemList[2] = 7
                    _itemList[3] = 15
                    _itemList[4] = 20
                    _priceIndex = _itemList[math.random(1, 4)]
                end
                -- print("Price " .. _priceIndex)
                SetTimeout(12000, function()
                    isRoll = false
                    -- Give Price
                    if _priceIndex == 1 or _priceIndex == 9 or _priceIndex == 13 or _priceIndex == 17 or _priceIndex == 20 then
                        print("Clothing Win | Mystery Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', math.random(500, 1500))
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and some casino chips!", 'success')
                    elseif _priceIndex == 2 then
                        print("RP Win | 2500 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 2500)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 2500 casino chips!", 'success')
                    elseif _priceIndex == 6 then
                        print("RP Win | 5000 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 5000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 5000 casino chips!", 'success')
                    elseif _priceIndex == 10 then
                        print("RP Win | 7500 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 7500)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 7500 casino chips!", 'success')
                    elseif _priceIndex == 14 then
                        print("RP Win | 10,000 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 1000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 1000 casino chips!", 'success')
                    elseif _priceIndex == 18 then
                        print("RP Win | 15,000 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 1000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 1000 casino chips!", 'success')
                    elseif _priceIndex == 3 or _priceIndex == 7 or _priceIndex == 15 or _priceIndex == 20 then
                        print("$ | Money Win")
                        local _money = 0
                        if _priceIndex == 3 then
                            _money = 2000
                        elseif _priceIndex == 7 then
                            _money = 3000
                        elseif _priceIndex == 15 then
                            _money = 4000
                        end
                        Player.Functions.AddMoney('cash', _money, "Lucky Wheel")
                        TriggerClientEvent('QBCore:Notify', _source, "You have won $".. _money.."!", 'success')
                    elseif _priceIndex == 4 or _priceIndex == 8 or _priceIndex == 11 or _priceIndex == 16 then
                        print("Coin Icon Win")
                        local _blackMoney = 0
                        if _priceIndex == 4 then
                            _blackMoney = 1000
                        elseif _priceIndex == 8 then
                            _blackMoney = 1000
                        elseif _priceIndex == 11 then
                            _blackMoney = 2000
                        elseif _priceIndex == 16 then
                            _blackMoney = 2000
                        end
                        Player.Functions.AddMoney('cash', _blackMoney, "Lucky Wheel")
                        TriggerClientEvent('QBCore:Notify', _source, "You have won $".. _blackMoney .."!", 'success')
                    elseif _priceIndex == 5 then
                        print("Discount Icon | Jacpot Win $100,000")
                        -- Player.Functions.AddMoney('cash', 100000, "Lucky Wheel")
                        -- TriggerClientEvent('QBCore:Notify', _source, "You have won the jackpot of $100.000!", 'success')
						TriggerClientEvent("luckywheel:winCar2", _source)
						TriggerClientEvent('QBCore:Notify', _source, "You have won the Random Car!", 'success')
                    elseif _priceIndex == 12 then
                        print("Mytery Symbol | Mystery Win")
						local mysterywin = math.random(5000, 10000)
						Player.Functions.AddMoney('cash', mysterywin, "Lucky Wheel")
                        TriggerClientEvent('QBCore:Notify', _source, "You have won $"..mysterywin.." Congratulations!", 'success')
                    elseif _priceIndex == 19 then
                        print("Vehicle Symbol | Win Car")
                        TriggerClientEvent("luckywheel:winCar", _source)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won the QuadraTurbo-R!", 'success')
                    end
                    TriggerClientEvent("luckywheel:rollFinished", -1)
                end)
                TriggerClientEvent("luckywheel:doRoll", -1, _priceIndex)
            else
                TriggerClientEvent("luckywheel:rollFinished", -1)    
                TriggerClientEvent('QBCore:Notify', _source, "Test!", 'success')
            end
        end
    end
end)

RegisterNetEvent('qb-rad:server:winvehicle')
AddEventHandler('qb-rad:server:winvehicle', function(vehicleData, garage)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local balance = pData.PlayerData.money["bank"]
    QBCore.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..pData.PlayerData.steam.."', '"..cid.."', '"..vehicle.."', '"..GetHashKey(vehicle).."', '', '"..plate.."', 0)")
    TriggerClientEvent("QBCore:Notify", src, "Congratulations! Your new vehicle is waiting outside!", "success", 5000)
    TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
    TriggerEvent(SpawnPunt)
end)

function GeneratePlate()
    local plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    QBCore.Functions.ExecuteSql(true, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        while (result[1] ~= nil) do
            plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
        end
        return plate
    end)
    return plate:upper()
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

RegisterNetEvent('qb-rad:server:winvehicle')
AddEventHandler('qb-rad:server:winvehicle', function(vehicleData, garage)
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.AddItem('daily_ticket', 1)
end)