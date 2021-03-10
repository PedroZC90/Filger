local _, ns = ...
local Config = ns.Config

----------------------------------------------------------------
-- Config
----------------------------------------------------------------
local xOffset, yOffset = 200, 39

Config["General"] = {

    ["ConfigMode"] = false,                         -- enables config mode for help on position frames.

    ["IconSize"] = 35,                              -- sets icons size.
    ["IconSpacing"] = 3,                            -- sets space between icons.

    ["BarWidth"] = 200,                             -- sets bar width.
    ["BarHeight"] = 18,                             -- sets bar height.
    ["BarSpacing"] = 7,                             -- sets space between bars.
    ["ClassColor"] = true,                          -- sets status bar color by class.

    ["BackdropColor"] = { .05, .05, .05 },
    ["BorderColor"] = { .125, .125, .125 },
}

Config["Plugins"] = {
    ["Tracer"] = false,                              -- enables aura tracer plugins.
}

Config["Panels"] = {
    -- LEFT
    {
        enabled = true,
        name = "PLAYER_AURAS",
        anchor = { "RIGHT", UIParent, "CENTER", -xOffset, 0 },
        limit = 8,
        size = Config["General"].IconSize,
        spacing = Config["General"].IconSpacing,
        initialAnchor = 'BOTTOMRIGHT',
        ['growth-x'] = "LEFT",
        ['growth-y'] = "DOWN",

        filter = "PLAYER|HELPFUL",
        unit = "player",
        caster = "player",
        showOnlyPlayer = true
    }, -- [1]
    {
        enabled = true,
        name = "PLAYER_DEBUFFS",
        anchor = { "RIGHT", UIParent, "CENTER", -xOffset, -yOffset },
        limit = 8,
        size = Config["General"].IconSize,
        spacing = Config["General"].IconSpacing,
        initialAnchor = 'BOTTOMRIGHT',
        ['growth-x'] = "LEFT",
        ['growth-y'] = "DOWN",

        filter = "HARMFUL",
        unit = "player",
        caster = "all",
        isDebuff = true
    }, -- [2]
    {
        enabled = true,
        name = "PLAYER_BUFFS",
        anchor = { "RIGHT", UIParent, "CENTER", -xOffset, yOffset },
        limit = 8,
        size = Config["General"].IconSize,
        spacing = Config["General"].IconSpacing,
        initialAnchor = 'BOTTOMRIGHT',
        ['growth-x'] = "LEFT",
        ['growth-y'] = "DOWN",

        filter = "HELPFUL",
        unit = "player",
        caster = "all",
        hidePlayer = true
    }, -- [3]

    -- RIGHT
    {
        enabled = true,
        name = "TARGET_AURAS",
        anchor = { "LEFT", UIParent, "CENTER", xOffset, 0 },
        limit = 8,
        size = Config["General"].IconSize,
        spacing = Config["General"].IconSpacing,
        initialAnchor = 'BOTTOMLEFT',
        ['growth-x'] = "RIGHT",
        ['growth-y'] = "DOWN",

        filter = "HELPFUL",
        unit = "target",
        caster = "player",
        showOnlyPlayer = false
    }, -- [4]
    {
        enabled = true,
        name = "TARGET_DEBUFFS",
        anchor = { "LEFT", UIParent, "CENTER", xOffset, -yOffset },
        limit = 8,
        size = Config["General"].IconSize,
        spacing = Config["General"].IconSpacing,
        initialAnchor = 'BOTTOMLEFT',
        ['growth-x'] = "RIGHT",
        ['growth-y'] = "DOWN",

        filter = "HARMFUL",
        unit = "target",
        caster = "player",
        isDebuff = true
    }, -- [5]
    {
        enabled = true,
        name = "PLAYER_COOLDOWNS",
        anchor = { "CENTER", UIParent, "BOTTOM", 0, 259 },
        limit = 8,
        size = 38,
        max_size = 40,
        spacing = 3,
        initialAnchor = "CENTER",
        ['growth-x'] = "CENTER",
        ['growth-y'] = "CENTER",

        filter = "COOLDOWN",
        unit = "player",
        caster = "player"
    } -- [6]
}

-- List of spells that do not need to be displayed
Config["BlackList"] = {
    ----------------------------------------------------------------
    -- Druid
    ----------------------------------------------------------------
    [1126] = true,              -- Mark of the Wild (Rank 1)
    [5232] = true,              -- Mark of the Wild (Rank 2)
    [6756] = true,              -- Mark of the Wild (Rank 3)
    [5234] = true,              -- Mark of the Wild (Rank 4)
    [8907] = true,              -- Mark of the Wild (Rank 5)
    [9884] = true,              -- Mark of the Wild (Rank 6)
    [9885] = true,              -- Mark of the Wild (Rank 7)

    [21849] = true,             -- Gift of the Wild (Rank 1)
    [21850] = true,             -- Gift of the Wild (Rank 2)

    [24932] = true,             -- Leader of the Pack

    [5487] = false,             -- Bear Form

    ----------------------------------------------------------------
    -- Mage
    ----------------------------------------------------------------
    [1459] = true,              -- Arcane Intellect (Rank 1)
    [1460] = true,              -- Arcane Intellect (Rank 2)
    [1461] = true,              -- Arcane Intellect (Rank 3)
    [10156] = true,             -- Arcane Intellect (Rank 4)
    [10157] = true,             -- Arcane Intellect (Rank 5)

    ----------------------------------------------------------------
    -- Priest
    ----------------------------------------------------------------
    [1243] = true,              -- Power Word: Fortitude (Rank 1)
    [1244] = true,              -- Power Word: Fortitude (Rank 2)
    [1245] = true,              -- Power Word: Fortitude (Rank 3)
    [2791] = true,              -- Power Word: Fortitude (Rank 4)
    [10937] = true,             -- Power Word: Fortitude (Rank 5)
    [10938] = true,             -- Power Word: Fortitude (Rank 6)

    [976] = true,               -- Shadow Protection (Rank 1)
    [10957] = true,             -- Shadow Protection (Rank 2)
    [10958] = true,             -- Shadow Protection (Rank 3)

    [27681] = true,             -- Prayer of Spirit (Rank 1)
    [14818] = true,             -- Prayer of Spirit (Rank 2)
    [14819] = true,             -- Prayer of Spirit (Rank 3)
    [27841] = true,             -- Prayer of Spirit (Rank 4)

    [21562] = true,             -- Prayer of Fortitude (Rank 1)

    ----------------------------------------------------------------
    -- Warlock
    ----------------------------------------------------------------
    [11766] = true,             -- Blood Pact
    [11767] = true,             -- Blood Pact
    [19480] = true,             -- Paranoia

    ----------------------------------------------------------------
    -- Shaman
    ----------------------------------------------------------------
    [5672] = true,              -- Healing Stream
    [8163] = true,              -- Strength of Earth
    [8836] = true,              -- Grace of Air
    [10491] = true,             -- Mana Spring

    ----------------------------------------------------------------
    -- General
    ----------------------------------------------------------------
    [15007] = true,             -- Ressurection Sickness
    [16609] = true,             -- Warchief's Blessing
    [22888] = true,             -- Rallying Cry of the Dragonslayer
    [1135] = true,              -- Drink
    [1137] = true,              -- Drink
    [1117] = true,              -- Food

    [8098] = true,              -- Intellect (Scroll III)
}

Config["Cooldowns"] = {
    ["PRIEST"] = {
        -- All
        [10060] = true,             -- Power Infusion

        -- Disciplie
        [14751] = true              -- Inner Focus
        -- Holy
        -- Shadow
    },
    ["ALL"] = {
        -- Horde Racials
        [20549] = true,             -- War Stomp (Tauren)
        [20572] = true,             -- Blood Fury (Orc)
        [26297] = true,             -- Berserking (Troll)

        -- Alliance Racials
        [20594] = true              -- Stoneform (Dwarf)
    }
}
