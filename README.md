# esx_tpnrp_luckywheel to qb-luckywheel
Created by Sn0wBiT & converted to QB Framework by Nathan#8860
Alterations made to payouts & .ytd for the lucky wheel

### Require:
- QBCore
- Server Running Build 2189
- Stream the Diamond Casino for placement or change co-ords

### BT-TARGET CONFIG
["casinowheel"] = {
    name = "casinowheel",
    coords = vector3(1109.7, 229.03, -49.64),
    debugPoly = false,
    useZ = true,
    radius = 1.5,
    options = {
        {
            type = "client",
            event = "casino:spinwheel",
            parameters = {},
            icon = "fas fa-coins",
            label = "Spin the wheel $500",
            job = {"all"},
        },
        {
            type = "client",
            event = "casino:turbowheel",
            parameters = {},
            icon = "fas fa-coins",
            label = "Turbo Spin $5000",
            job = {"all"},
        },
        {
            type = "client",
            event = "casino:luckyticket",
            parameters = {},
            icon = "fas fa-coins",
            label = "Spin the wheel [Ticket]",
            job = {"all"},
        },
    },
    distance = 1.5
},

### PED SPAWN
-- LUCKY WHEEL CASINO LADY
{
    model = `u_f_m_casinoshop_01`, -- Model name as a hash.
    coords = vector4(1109.7, 229.03, -49.64, 185.62), -- (X, Y, Z, Heading)
    gender = 'female', -- The gender of the ped, used for the CreatePed native.
    scenario = 'WORLD_HUMAN_STAND_IMPATIENT', -- Task Scenario
},

### KNOWN ISSUE
Sometimes it will land on "CAR" but not payout this is an error within my math I believe, I have added a server side print so you can see what the person landed on if a complaint occurs.