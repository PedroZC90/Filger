local _, ns = ...
local Filger = ns.Filger
local Config = ns.Config
local Cooldowns = Config["Cooldowns"]
local BlackList = Config["BlackList"]

local Item = Item

----------------------------------------------------------------
-- Development (write anything here)
----------------------------------------------------------------
-- local frame = CreateFrame("Frame", nil, UIParent)
-- frame.name = "TEST"
-- frame.expiration = 5000
-- frame.duration = 5
-- frame.start = frame.duration + GetTime()
-- frame.first = true

-- print(frame.start, frame.duration)

-- frame:SetScript("OnUpdate", Filger.UpdateAuraTimer)

----------------------------------------------------------------
-- Item Mixin
----------------------------------------------------------------
-- local item = Item:CreateFromItemID(21524)

-- item:ContinueOnItemLoad(function()
-- 	local name = item:GetItemName()
-- 	local icon = item:GetItemIcon()
-- 	print(name, icon) -- "Red Winter Hat", 133169
-- end)
