Config = {}

-- Minimum police required to spawn the truck
Config.MinPoliceRequired = 2

-- Armored truck settings
Config.TruckModel = "stockade"  -- Model of the truck
Config.SpawnLocations = {
    { coords = vector3(-1580.51, -377.12, 44.87) },
    { coords = vector3(-930.87, -318.20, 39.14) },
    { coords = vector3(-554.29, -160.42, 38.21) },
    { coords = vector3(-109.72, -47.65, 71.46) }
}

-- Chop shop locations
Config.ChopLocations = {
    vector3(1752.94, 3323.33, 41.19),
    vector3(-559.01, -1797.90, 22.60),
    vector3(-199.70, 6272.69, 31.48)
}

-- Chop shop blip settings
Config.ChopShopBlip = {
    Sprite = 214,    -- Blip sprite ID
    Color = 2,       -- Blip color (green)
    Scale = 0.8,     -- Blip scale
    Name = "Chop Shop" -- Blip name
}

-- Reward settings
Config.Rewards = {
    Money = {
        Min = 10000,  -- Minimum money reward
        Max = 25000   -- Maximum money reward
    },
    Items = {        -- List of items that can be rewarded
        "diamond",
        "gold",
        "weapon_pistol"
    }
}
