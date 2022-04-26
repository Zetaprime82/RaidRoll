local loadAddon = CreateFrame("Frame")
local loginin = true
loadAddon:RegisterEvent("ADDON_LOADED")
loadAddon:RegisterEvent("PLAYER_LOGIN")
loadAddon:SetScript("OnEvent",function(self,event,...)
    if(loginin == true and ((event == "ADDON_LOADED") or (event == "PLAYER_LOGIN"))) then
        loginin = nil
        if not RaidRollDB then RaidRollDB = { }  end
        if not RaidRollDB.setting then
            RaidRollDB.setting = { }
            Set_Default_Setting_Value()
        end
        if PC_MinimapPos == nil then
            PC_MinimapPos = { ["minimapPos"] = 206.3376812873, ["hide"] = false }
        end
        if RaidRollDB.localization then
            GetLocalizationMarker(RaidRollDB.localization);
        else
            Setting.Localization = localizationEN;
        end
        GenerationMiniMapIcon();
        --Set_Default_Setting_Value()
        if RaidRollDB.RaidRoll_RollItemList then
           RaidRoll_RollItemList = RaidRollDB.RaidRoll_RollItemList;
           Print_RollItemList()
           Save_BD_RollItemList();
        end
        RaidRoll_RespMining_SetText();
        Set_BD_Setting_Value();
        --localization = GetLocalization();
        --CreateText()
    end
end)