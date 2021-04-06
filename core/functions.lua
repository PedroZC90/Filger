local _, ns = ...
local Filger = ns.Filger
local Config = ns.Config
local Cooldowns = Config.Cooldowns
local BlackList = Config.BlackList

-- WoW API
local GetTime = GetTime
local GetSpellInfo = GetSpellInfo
local GetInventoryItemLink, GetInventoryItemCooldown  = GetInventoryItemLink, GetInventoryItemCooldown
local GetItemInfo, GetItemInfoInstant, GetItemCooldown = GetItemInfo, GetItemInfoInstant, GetItemCooldown

table.remove_key = function(table, key)
    local value = table[key]
    table[key] = nil
    return value
end

local format = string.format
local floor, ceil = math.floor, math.ceil

----------------------------------------------------------------
-- Functions
----------------------------------------------------------------
Filger.IconCoord = { .08, .92, .08, .92 }

function Filger.Print(...)
    print(format("|cff00ff96Filger:|r"), ...)
end

function Filger.Debug(...)
    print(format("|cffff330fFilger WARNING:|r"), ...)
end

-- format seconds to min/hour/day
function Filger.FormatTime(s)
	local Day, Hour, Minute = 86400, 3600, 60

	if (s >= Day) then
		return format("%dd", ceil(s / Day))
	elseif (s >= Hour) then
		return format("%dh", ceil(s / Hour))
	elseif (s >= Minute) then
		return format("%dm", ceil(s / Minute))
	elseif (s >= Minute / 12) then
		return floor(s)
	end

	return format("%.1f", s)
end

-- compute table size
function Filger.TableLength(table)
    local count = 0
    for _ in pairs(table) do count = count + 1 end
    return count
end

function Filger.TableStruct(data)
    for index, element in ipairs(data) do
        print(index)
        for key, value in pairs(element) do
            print(" ", key, value)
        end
    end
    print("length:", Filger.TableLength(data))
end

-- update aura display timer (text or status bar)
function Filger.UpdateAuraTimer(self, elapsed)
    self.timeleft = self.timeleft or 0
    self.elapsed = (self.elapsed or 0) + elapsed
    if (self.elapsed >= 0.1) then
        if (not self.first) then
            self.timeleft = self.timeleft - self.elapsed
        else
            self.timeleft = (self.expiration) - GetTime()
        end

        if (self.timeleft > 0) then
            -- update time bar
            if (self.statusbar) then
                self.statusbar:SetValue(self.timeleft)
            end

            -- update time text
			if (self.time) then
                self.time:SetText(Filger.FormatTime(self.timeleft))
				if (self.timeleft <= 5) then
					self.time:SetTextColor(0.99, 0.31, 0.31)
				else
					self.time:SetTextColor(0.84, 0.75, 0.65)
				end
			end
        else
            if (self.time) then self.time:SetText("") end
            self.start = 0
            self.duration = 0
            self.expiration = 0
            self:SetScript("OnUpdate", nil)
			self:Hide()
        end

        self.elapsed = 0
    end
end

local validadeSpellTable = function(unit, spells, spell_table)
    for _, v in ipairs(spells) do
        if (v.check) then
            if (v.spellID) then
                local name = GetSpellInfo(v.spellID)
                if (name) then
                    table.insert(spell_table, v)
                else
                    Filger.Debug("spellID (" .. v.spellID .. ") is invalid.")
                end
            elseif (v.slotID) then
                local itemLink = GetInventoryItemLink(unit, v.slotID)
                if (itemLink) then
                    table.insert(spell_table, v)
                else
                    Filger.Debug("Invalid slotID (" .. v.slotID .. ").")
                end
            elseif (v.itemID) then
                -- method GetItemInfo may not return item information when the games starts
                -- because some item data may not have been cached from the server.
                -- to avoid that we need to use GetItemInfoInstant or ItemMixin.
                local itemID = GetItemInfoInstant(v.itemID)
                if (itemID) then
                    table.insert(spell_table, v)
                else
                    Filger.Debug("Invalid itemID (" .. v.itemID .. ").")
                end
            end
        end
    end
end

-- build cooldown list
-- concatenates player class spells and all class spells
-- remove unknown spells
function Filger.BuildCooldownList(unit)
    local cooldowns = {}
    local class = Filger.MyClass

    if (not Cooldowns) then Cooldowns = {} end
    if (not Cooldowns[class]) then Cooldowns[class] = {} end
    if (not Cooldowns["ALL"]) then Cooldowns["ALL"] = {} end

    validadeSpellTable(unit, Cooldowns[class], cooldowns)
    validadeSpellTable(unit, Cooldowns["ALL"], cooldowns)

    return cooldowns
end

-- filter black list by removing unknown spells
function Filger.BuildBlackList()
    for spellID, check in pairs(BlackList) do
        local name = GetSpellInfo(spellID)
        if (not check or not name) then
            if (not name) then
                Filger.Debug("spellID (" .. spellID .. ") is invalid.")
            end
            table.remove_key(BlackList, spellID)
        end
    end
end
