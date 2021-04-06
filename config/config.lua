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

    ["HideWellFed"] = true,                         -- enabled filter to hide well fed buff (too many spells with this name)

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
    ["PALADIN"] = {
        -- All
        { spellID = 498, check = true },                -- Divine Protection
        { spellID = 642, check = true },                -- Divine Shield
        { spellID = 633, check = true },                -- Lay on Hands
        { spellID = 1022, check = true },               -- Blessing of Protection
        { spellID = 1044, check = true },               -- Blessing of Freedom
        { spellID = 6940, check = true },               -- Blessing of Sacrifice

        -- Protection
    },
    ["PRIEST"] = {
        -- All
        { spellID = 10060, check = true },             -- Power Infusion

        -- Disciplie
        { spellID = 14751, check = true }              -- Inner Focus

        -- Holy
        -- Shadow
    },
    ["WARRIOR"] = {
        -- All
        { spellID = 1161, check = true },               -- Challenging Shout
        { spellID = 2565, check = true },               -- Shield Block (Rank 1)
        { spellID = 3411, check = true },               -- Intervene
        { spellID = 6544, check = true },               -- Heroic Leap
        { spellID = 18499, check = true },              -- Berserker Rage
        { spellID = 97462, check = true },              -- Rallying Cry (Rank 1)
        { spellID = 190456, check = true },             -- Ignore Pain
        { spellID = 231847, check = true },             -- Shield Block (Rank 2)
        { spellID = 316825, check = true },             -- Rallying Cry (Rank 2)

        -- Protection
        { spellID = 871, check = true },                -- Shield Wall
        { spellID = 12975, check = true },              -- Last Stand
        { spellID = 23920, check = true },              -- Spell Reflection
        { spellID = 107574, check = true },             -- Avatar
        { spellID = 316438, check = true },             -- Avatar (Rank 2)
        { spellID = 316778, check = true },             -- Ignore Pain (Rank 2)
        { spellID = 316834, check = true },             -- Shield Wall
        { spellID = 107570, check = true },             -- Storm Bolt
    },
    ["ALL"] = {
        -- Horde Racials
        { spellID = 20549, check = true },             -- War Stomp (Tauren)
        { spellID = 20572, check = true },             -- Blood Fury (Orc)
        { spellID = 26297, check = true },             -- Berserking (Troll)

        -- Alliance Racials
        { spellID = 20594, check = true }              -- Stoneform (Dwarf)
    }
}
