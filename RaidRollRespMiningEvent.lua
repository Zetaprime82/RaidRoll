local _rollMessageTailRegex = RANDOM_ROLL_RESULT:gsub("%(", "%%("):gsub("%)", "%%)"):gsub("%%d", "(%%d+)"):gsub("%%%d+%$d", "(%%d+)"):gsub("%%s", ""):gsub("%%%d+%$s", "").. "$"
local fir = CreateFrame("Frame")
timerLastSec = 5;
userMainName = GetUnitName("player",true);
timer30s = 30;
fir:RegisterEvent("CHAT_MSG_WHISPER")
fir:RegisterEvent("CHAT_MSG_RAID_WARNING")
fir:RegisterEvent("CHAT_MSG_SYSTEM")
fir:SetScript("OnEvent",function(self,event,...)
    if event == "CHAT_MSG_SYSTEM" then
        if RaidRoll_RollStatus then
            local msg, arg1 = ...
            if msg then
                local roll, min, max = msg:match(_rollMessageTailRegex)
                local name = msg:gsub("%s*" .. _rollMessageTailRegex, "")
                if(SearchUserRollItem(name)) then
                    roll = tonumber(roll)
                    min = tonumber(min)
                    max = tonumber(max)
                    if roll then
                        if RaidRoll_RollStatus then
                            if roll and (min == 1 or min == 0) and max == 100 then
                                Add_NewRoll(name,roll)
                            else
                                print("|cFFFF0000"..name..localization.NoBoundsRoll.."Min: ("..min..") Max: ("..max..")")
                            end
                        end
                    end
                else
                    print(name..Setting.Localization.DoubleRoll)
                end
            end
        end
        if RaidRoll_SimpleUser_RollStatus then
            local msg, arg1 = ...
            if msg then
                local roll, min, max = msg:match(_rollMessageTailRegex)
                local name = msg:gsub("%s*" .. _rollMessageTailRegex, "")
                roll = tonumber(roll)
                min = tonumber(min)
                max = tonumber(max)
                if SimpleUser_SearchRoller(name) then
                    if roll then
                        if RaidRoll_SimpleUser_RollStatus then
                            if roll and (min == 1 or min == 0) and max == 100 then
                                SimpleUser_Add_NewRoll(name,roll);
                            else
                                print("|cFFFF0000"..name..localization.NoBoundsRoll.."Min: ("..min..") Max: ("..max..")")
                            end
                        end
                    end
                end
            end
        end
    end
    if event == "CHAT_MSG_WHISPER" then
        if RaidRollDB.setting.GetItemPM then
            if IsInRaid(0) or IsInGroup(0) then
                if IsInRaid(0) or IsInGroup(0) then
                    local message, author = ...
                    local result = select(3, string.find(message, "(|.+|r)"))
                    if userMainName ~= select(1,strsplit("-", author, 2)) then
                        if result then
                            local itemm, _, itemRarity, itemLevel, _, _, _, _, ItemLoc = GetItemInfo(result);
                            if itemm then
                                if Check_Correct_Item(result) then
                                    if not(author == UnitName("Player").."-"..GetRealmName())  then
                                        Add_RollItemList(result, author)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if event == "CHAT_MSG_RAID_WARNING" then
        local message, author = ...
        local item = select(3, string.find(message, "(|.+|r)"));
        if item then
            local itemm, _, itemRarity, itemLevel, _, _, _, _, ItemLoc = GetItemInfo(item);
            if itemm then
                if itemLevel ~= nil then
                    SimpleUser_Add_RollItem(item, author)
                end
            end
        end
    end
end)
fir:SetScript("OnUpdate",function(self, elapsed,...)
    if RaidRoll_RollStatus then
        if RaidRoll_RollStatus_timer then
            if timerRoll <= GetTime()  then
                if(RaidRollDB.setting.TimerAutoStopOn)then
                    RollEnd(RaidRoll_RollItemID);
                end
                timerLastSec = 5;
                RaidRoll_RollStatus_timer = false;
            else
                if (timerRoll-GetTime() >= RaidRollDB.setting.TimerCountSecAnons-1) then
                    if timerRoll-GetTime()<= timer30s then
                        Anons_RollRaidOrGroup(Setting.Localization.timerRollEnd..' '..RaidRoll_RollItemList[RaidRoll_RollItemID].item..' '..Setting.Localization.timerRollOst..(timer30s)..' '..Setting.Localization.seconds)
                        timer30s = timer30s -RaidRollDB.setting.TimerCountSecAnons;
                    end
                else
                    if timerRoll-GetTime()<=timerLastSec then
                        Anons_RollRaidOrGroup(Setting.Localization.timerRollEnd..' '..RaidRoll_RollItemList[RaidRoll_RollItemID].item..' '..Setting.Localization.timerRollOst..(timerLastSec)..' '..Setting.Localization.seconds)
                        timerLastSec = timerLastSec-1;
                    end
                end
            end
        end
    end
end)
SLASH_ROLLING1 = "/rr"
SlashCmdList["ROLLING"] = function(msg)
    local arg, arg1, arg2 = strsplit(" ", msg, 3)
    bla = nil
    if arg ~= nil then
        if arg == "add" then
            _, bla = strsplit(" ", msg, 2)
            if bla ~= nil then
                Add_RollItemList(bla, UnitName("Player").."-"..GetRealmName())
            else
                print("|cff00ccff"..localization.InvaildArgumen)
            end
        elseif arg == "show" then
            RaidRoll_RespMining_MainForm:Show()
        elseif arg == "list" then
            simpleUserWindow:Show()
        end
    else
        RaidRoll_RespMining_MainForm:Show()
    end
end