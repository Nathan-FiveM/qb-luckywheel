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
                        _prizeIndex = 19
                    else
                        _prizeIndex = 3
                    end
                elseif _randomPrice > 1 and _randomPrice <= 6 then
                    -- Win skin AK Gold
                    _prizeIndex = 12
                    local _subRan = math.random(1,20)
                    if _subRan <= 2 then
                        _prizeIndex = 12
                    else
                        _prizeIndex = 7
                    end
                elseif _randomPrice > 6 and _randomPrice <= 15 then
                    -- Black money
                    -- 4, 8, 11, 16
                    local _sRan = math.random(1, 4)
                    if _sRan == 1 then
                        _prizeIndex = 4
                    elseif _sRan == 2 then
                        _prizeIndex = 8
                    elseif _sRan == 3 then
                        _prizeIndex = 11
                    else
                        _prizeIndex = 16
                    end
                elseif _randomPrice > 15 and _randomPrice <= 25 then
                    -- Win 300,000$
                    -- _prizeIndex = 5
                    local _subRan = math.random(1,20)
                    if _subRan <= 2 then
                        _prizeIndex = 5
                    else
                        _prizeIndex = 20
                    end
                elseif _randomPrice > 25 and _randomPrice <= 40 then
                    -- 1, 9, 13, 17
                    local _sRan = math.random(1, 4)
                    if _sRan == 1 then
                        _prizeIndex = 1
                    elseif _sRan == 2 then
                        _prizeIndex = 9
                    elseif _sRan == 3 then
                        _prizeIndex = 13
                    else
                        _prizeIndex = 17
                    end
                elseif _randomPrice > 40 and _randomPrice <= 60 then
                    local _itemList = {}
                    _itemList[1] = 2
                    _itemList[2] = 6
                    _itemList[3] = 10
                    _itemList[4] = 14
                    _itemList[5] = 18
                    _prizeIndex = _itemList[math.random(1, 5)]
                elseif _randomPrice > 60 and _randomPrice <= 100 then
                    local _itemList = {}
                    _itemList[1] = 3
                    _itemList[2] = 7
                    _itemList[3] = 15
                    _itemList[4] = 20
                    _prizeIndex = _itemList[math.random(1, 4)]
                end
                -- print("Price " .. _prizeIndex)
                SetTimeout(12000, function()
                    isRoll = false
                    -- Give Price
                    if _prizeIndex == 1 or _prizeIndex == 9 or _prizeIndex == 13 or _prizeIndex == 17 or _prizeIndex == 20 then
                        print("Clothing Win | Mystery Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', math.random(500, 1500))
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and some casino chips!", 'success')
                    elseif _prizeIndex == 2 then
                        print("RP Win | 2500 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 2500)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 2500 casino chips!", 'success')
                    elseif _prizeIndex == 6 then
                        print("RP Win | 5000 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 5000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 5000 casino chips!", 'success')
                    elseif _prizeIndex == 10 then
                        print("RP Win | 7500 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 7500)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 7500 casino chips!", 'success')
                    elseif _prizeIndex == 14 then
                        print("RP Win | 10,000 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 1000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 1000 casino chips!", 'success')
                    elseif _prizeIndex == 18 then
                        print("RP Win | 15,000 Chips & Whiskey")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 1000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 1000 casino chips!", 'success')
                    elseif _prizeIndex == 3 or _prizeIndex == 7 or _prizeIndex == 15 or _prizeIndex == 20 then
                        print("$ | Money Win")
                        local _money = 0
                        if _prizeIndex == 3 then
                            _money = 2000
                        elseif _prizeIndex == 7 then
                            _money = 3000
                        elseif _prizeIndex == 15 then
                            _money = 4000
                        end
                        Player.Functions.AddMoney('cash', _money, "Lucky Wheel")
                        TriggerClientEvent('QBCore:Notify', _source, "You have won $".. _money.."!", 'success')
                    elseif _prizeIndex == 4 or _prizeIndex == 8 or _prizeIndex == 11 or _prizeIndex == 16 then
                        print("Coin Icon Win")
                        local _blackMoney = 0
                        if _prizeIndex == 4 then
                            _blackMoney = 1000
                        elseif _prizeIndex == 8 then
                            _blackMoney = 1000
                        elseif _prizeIndex == 11 then
                            _blackMoney = 2000
                        elseif _prizeIndex == 16 then
                            _blackMoney = 2000
                        end
                        Player.Functions.AddMoney('cash', _blackMoney, "Lucky Wheel")
                        TriggerClientEvent('QBCore:Notify', _source, "You have won $".. _blackMoney .."!", 'success')
                    elseif _prizeIndex == 5 then
                        print("Discount Icon | Jacpot Win $100,000")
                        -- Player.Functions.AddMoney('cash', 100000, "Lucky Wheel")
                        -- TriggerClientEvent('QBCore:Notify', _source, "You have won the jackpot of $100.000!", 'success')
						TriggerClientEvent("luckywheel:winCar2", _source)
						TriggerClientEvent('QBCore:Notify', _source, "You have won the Random Car!", 'success')
                    elseif _prizeIndex == 12 then
                        print("Mytery Symbol | Mystery Win")
						local mysterywin = math.random(5000, 10000)
						Player.Functions.AddMoney('cash', mysterywin, "Lucky Wheel")
                        TriggerClientEvent('QBCore:Notify', _source, "You have won $"..mysterywin.." Congratulations!", 'success')
                    elseif _prizeIndex == 19 then
                        print("Vehicle Symbol | Win Car")
                        TriggerClientEvent("luckywheel:winCar", _source)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won the QuadraTurbo-R!", 'success')
                    end
                    TriggerClientEvent("luckywheel:rollFinished", -1)
                end)
                TriggerClientEvent("luckywheel:doRoll", -1, _prizeIndex)
            else
                TriggerClientEvent("luckywheel:rollFinished", -1)    
                TriggerClientEvent('QBCore:Notify', _source, "Test!", 'success')
            end
        end
    end
end)

RegisterServerEvent('luckywheel:getMoneyLucky')
AddEventHandler('luckywheel:getMoneyLucky', function()
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    local bankamount = Player.PlayerData.money["cash"]
    if not isRoll then
        if Player ~= nil then
            if bankamount >= 0 then
                Player.Functions.RemoveMoney("cash", 500, "casino-roll-purchased")
                isRoll = true
                local _randomPrice = math.random(1, 105)
                    print(_randomPrice.. "This is the random roll")
                if _randomPrice == 1 then
                    _prizeIndex = 19
                elseif _randomPrice > 1 and _randomPrice <= 5 then
                    _prizeIndex = 20
                elseif _randomPrice > 5 and _randomPrice <= 10 then
                    _prizeIndex = 18
                elseif _randomPrice > 10 and _randomPrice <= 15 then
                    _prizeIndex = 17
                elseif _randomPrice > 15 and _randomPrice <= 20 then
                    _prizeIndex = 16
                elseif _randomPrice > 20 and _randomPrice <= 25 then
                    _prizeIndex = 15
                elseif _randomPrice > 25 and _randomPrice <= 30 then
                    _prizeIndex = 14
                elseif _randomPrice > 30 and _randomPrice <= 35 then
                    _prizeIndex = 13
                elseif _randomPrice > 35 and _randomPrice <= 40 then
                    _prizeIndex = 12
                elseif _randomPrice > 45 and _randomPrice <= 50 then
                    _prizeIndex = 11
                elseif _randomPrice > 55 and _randomPrice <= 60 then
                    _prizeIndex = 10
                elseif _randomPrice > 60 and _randomPrice <= 65 then
                    _prizeIndex = 9
                elseif _randomPrice > 65 and _randomPrice <= 70 then
                    _prizeIndex = 8
                elseif _randomPrice > 70 and _randomPrice <= 75 then
                    _prizeIndex = 7
                elseif _randomPrice > 75 and _randomPrice <= 80 then
                    _prizeIndex = 6
                elseif _randomPrice > 80 and _randomPrice <= 85 then
                    _prizeIndex = 5
                elseif _randomPrice > 85 and _randomPrice <= 90 then
                    _prizeIndex = 4
                elseif _randomPrice > 90 and _randomPrice <= 95 then
                    _prizeIndex = 3
                elseif _randomPrice > 95 and _randomPrice <= 100 then
                    _prizeIndex = 2
                elseif _randomPrice > 100 and _randomPrice <= 105 then
                    _prizeIndex = 1
                end
                -- PAYOUT TIME BITCH
                SetTimeout(12000, function()
                    isRoll = false
                    -- Give Prize
                    if _prizeIndex == 1 then
                        print("Prize 1")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', math.random(500, 1500))
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and some casino chips!", 'success')
                    elseif _prizeIndex == 2 then
                        print("Prize 2")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 2500)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 2500 casino chips!", 'success')
                    elseif _prizeIndex == 3 then
                        print("Prize 3")
                        _money = 2000
                    elseif _prizeIndex == 4 then
                        print("Prize 4")
                        _blackMoney = 1000
                    elseif _prizeIndex == 5 then
                        print("Prize 5")
						TriggerClientEvent("luckywheel:winCar2", _source)
						TriggerClientEvent('QBCore:Notify', _source, "You have won the Random Car!", 'success')
                    elseif _prizeIndex == 6 then
                        print("Prize 6")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 5000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 5000 casino chips!", 'success')
                    elseif _prizeIndex == 7 then
                        print("Prize 7")
                        _money = 3000
                    elseif _prizeIndex == 8 then
                        print("Prize 8")
                        _blackMoney = 1000
                    elseif _prizeIndex == 9 then
                        print("Prize 9")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', math.random(500, 1500))
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and some casino chips!", 'success')
                    elseif _prizeIndex == 10 then
                        print("Prize 10")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 7500)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 7500 casino chips!", 'success')
                    elseif _prizeIndex == 11 then
                        print("Prize 11")
                        _blackMoney = 2000
                    elseif _prizeIndex == 12 then
                        print("Prize 12")
						local mysterywin = math.random(5000, 10000)
						Player.Functions.AddMoney('cash', mysterywin, "Lucky Wheel")
                        TriggerClientEvent('QBCore:Notify', _source, "You have won $"..mysterywin.." Congratulations!", 'success')
                    elseif _prizeIndex == 13 then
                        print("Prize 13")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', math.random(500, 1500))
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and some casino chips!", 'success')
                    elseif _prizeIndex == 14 then
                        print("Prize 14")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 1000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 1000 casino chips!", 'success')
                    elseif _prizeIndex == 15 then
                        print("Prize 15")
                        _money = 4000
                    elseif _prizeIndex == 16 then
                        print("Prize 16")
                        _blackMoney = 2000
                    elseif _prizeIndex == 17 then
                        print("Prize 17")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', math.random(500, 1500))
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and some casino chips!", 'success')
                    elseif _prizeIndex == 18 then
                        print("Prize 18")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', 1000)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and 1000 casino chips!", 'success')
                    elseif _prizeIndex == 19 then
                        print("Prize 19")
                        TriggerClientEvent("luckywheel:winCar", _source)
                        TriggerClientEvent('QBCore:Notify', _source, "You have won the QuadraTurbo-R!", 'success')
                    elseif _prizeIndex == 20 then
                        print("Prize 20")
                        Player.Functions.AddItem('whiskey', 1)
                        Player.Functions.AddItem('casinochips', math.random(500, 1500))
                        TriggerClientEvent('QBCore:Notify', _source, "You have won some whiskey and some casino chips!", 'success')
                    end
                    TriggerClientEvent("luckywheel:rollFinished", -1)
                    print(_prizeIndex)
                end)
                TriggerClientEvent("luckywheel:doMoneyRoll", -1, _prizeIndex)
            else
                TriggerClientEvent("luckywheel:rollFinished", -1)    
                TriggerClientEvent('QBCore:Notify', _source, "Test!", 'success')
            end
        end
    end
end)

--[[ if _prizeIndex == 1 then
    print("Prize 1")
elseif _prizeIndex == 2 then
    print("Prize 2")
elseif _prizeIndex == 3 then
    print("Prize 3")
elseif _prizeIndex == 4 then
    print("Prize 4")
elseif _prizeIndex == 5 then
    print("Prize 5")
elseif _prizeIndex == 6 then
    print("Prize 6")
elseif _prizeIndex == 7 then
    print("Prize 7")
elseif _prizeIndex == 8 then
    print("Prize 8")
elseif _prizeIndex == 9 then
    print("Prize 9")
elseif _prizeIndex == 10 then
    print("Prize 10")
elseif _prizeIndex == 11 then
    print("Prize 11")
elseif _prizeIndex == 12 then
    print("Prize 12")
elseif _prizeIndex == 13 then
    print("Prize 13")
elseif _prizeIndex == 14 then
    print("Prize 14")
elseif _prizeIndex == 15 then
    print("Prize 15")
elseif _prizeIndex == 16 then
    print("Prize 16")
elseif _prizeIndex == 17 then
    print("Prize 17")
elseif _prizeIndex == 18 then
    print("Prize 18")
elseif _prizeIndex == 19 then
    print("Prize 19")
elseif _prizeIndex == 20 then
    print("Prize 20")
end ]]

RegisterNetEvent('qb-rad:server:winvehicle')
AddEventHandler('qb-rad:server:winvehicle', function(vehicleData, garage)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local balance = pData.PlayerData.money["bank"]
    exports.ghmattimysql:execute('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @state)', {
        ['@license'] = Player.PlayerData.license,
        ['@citizenid'] = Player.PlayerData.citizenid,
        ['@vehicle'] = vehicle,
        ['@hash'] = GetHashKey(vehicle),
        ['@mods'] = '',
        ['@plate'] = plate,
        ['@state'] = 0
    })
    
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