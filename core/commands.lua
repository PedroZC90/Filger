local _, ns = ...
local Filger = ns.Filger
local Config = ns.Config

----------------------------------------------------------------
-- Commands
----------------------------------------------------------------
-- imports
local tinsert, tsort = table.insert, table.sort
local strsplit = string.strsplit

-- string formats
local STRING_COLOR = "|cffb3ff19%s|r"   --"|cff00ff96%s|r"

local AddOnCommands = {}

local function CmdSplit(cmd)
    if (cmd:find("%s")) then
        return strsplit(" ", cmd)
    end
    return cmd
end

SLASH_FILGER1 = "/filger"
SlashCmdList["FILGER"] = function(cmd)
    local arg1, arg2 = CmdSplit(cmd)

    if (arg1 == "show") then
        for index, frame in ipairs(Filger) do
            frame.Backdrop:Show()
            frame.text:Show()
        end
    elseif (arg1 == "hide") then
        for index, frame in ipairs(Filger) do
            frame.Backdrop:Hide()
            frame.text:Hide()
        end
    elseif (arg1 == "") or (arg1 == "help") then
        print(" ")
        print(STRING_COLOR:format("Filger Commands:"))
        print(STRING_COLOR:format("show:"), "Display Frames.")
        print(STRING_COLOR:format("hide:"), "Hide Frames.")
        print(STRING_COLOR:format("reset"), "Reset saved variables.")
        print(STRING_COLOR:format("tracer"), "Start/Stop filger aura tracer.")
        print(" ")
    elseif (AddOnCommands[arg1]) then
        AddOnCommands[arg1](arg2)
    end
end

Filger.AddOnCommands = AddOnCommands
