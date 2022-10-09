Setting = {}
Setting.LocalizationMarker = "en"
Setting.Localization = {}
function Check_Correct_Item(item)
    local itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, sellPrice, classID, subclassID, bindType, expacID, setID, isCraftingReagent = GetItemInfo(item);
    if itemName then
        if RaidRollDB.setting.GetItemMinILvl then
            if not (tonumber(RaidRollDB.setting.GetItemMinILvl) <= itemLevel) then
                return false
            end
        end
        if itemQuality then
            if itemQuality == 0 then
                if not(RaidRollDB.setting.GetItemQualityPoor) then
                    return false
                end
            end
            if itemQuality == 1 then
                if not(RaidRollDB.setting.GetItemQualityCommon) then
                    return false
                end
            end
            if itemQuality == 2 then
                if not(RaidRollDB.setting.GetItemQualityUncommon) then
                    return false
                end
            end
            if itemQuality == 3 then
                if not(RaidRollDB.setting.GetItemQualityRare) then
                    return false
                end
            end
            if itemQuality == 4 then
                if not(RaidRollDB.setting.GetItemQualityEpic) then
                    return false
                end
            end
            if itemQuality == 5 then
                if not(RaidRollDB.setting.GetItemQualityLegend) then
                    return false
                end
            end
        end
        return true;

    end
end
function GetLocalizationMarker(marker)
    if(marker == "en") then
        Setting.Localization = localizationEN;
    end
end
function Get_RollerList()
    local numbers = GetNumGroupMembers();
    local RollRollerList = {}
    for i = 1, numbers, 1 do
        local name = GetRaidRosterInfo(i)
        local subname, realm = strsplit("-", name,2)
        if not realm then
            realm = GetRealmName()
        end
        RollRollerList[subname] = {}
        RollRollerList[subname]["realm"] = realm;
        RollRollerList[subname]["class"] = Get_CharactersClassID(i);
        RollRollerList[subname]["fullName"] = subname.."-"..realm;
    end
    return RollRollerList;
end
function Get_CharactersClassID(i)
    local class = 0;
    if IsInRaid(0) then
        class = select(3, UnitClass("RAID"..i))
    elseif IsInGroup(0) then
        class = select(3, UnitClass("party"..i-1))
        if class == nil then
            class = select(3, UnitClass("Player"))
        end
    else
        class = select(3, UnitClass("Player"))
    end
    return class;
end
function Sort_RollList(id)
    if RaidRoll_RollItemList[id].rollList.count > 1 then
        for i = 1, RaidRoll_RollItemList[id].rollList.count do
            for j = 1, RaidRoll_RollItemList[id].rollList.count-i do
                if (RaidRoll_RollItemList[id].rollList[j+1].roll > RaidRoll_RollItemList[id].rollList[j].roll) then
                    NewRaidRollItemList = RaidRoll_RollItemList[id].rollList[j+1]
                    RaidRoll_RollItemList[id].rollList[j+1] = RaidRoll_RollItemList[id].rollList[j];
                    RaidRoll_RollItemList[id].rollList[j] = NewRaidRollItemList;
                end
            end
        end
    end
end
function Update_Language(self,language)
    RaidRollDB.localization = language;
    GetLocalizationMarker(RaidRollDB.localization);
    RaidRoll_RespMining_SetText()
end
function ViewsRaidRollRemasterMain()
    RaidRoll_RespMining_MainForm:Show();
end
function ViewsRaidRollRemasterSimpleUser()
    simpleUserWindow:Show();
end
function GenerationMiniMapIcon()
    local PC_MinimapBtn = LibStub ("LibDataBroker-1.1"):NewDataObject("PoisonCharges", {
        type = "data source",
        text = "PoisonCharges",
        icon = "Interface\\Buttons\\ui-grouploot-dice-up",
        OnClick = function(_, button)
            if button == "LeftButton" then
                ViewsRaidRollRemasterMain()
            end
            if button == "RightButton" then
                ViewsRaidRollRemasterSimpleUser()
            end
        end,
        OnTooltipShow = function(tt)
            tt:AddLine("RaidRoll RoR")
            tt:AddLine(Setting.Localization.MiniMap_1)
            tt:AddLine(Setting.Localization.MiniMap_2)
        end,
    })
    local icon = LibStub("LibDBIcon-1.0")
    icon:Register("PoisonCharges", PC_MinimapBtn, PC_MinimapPos)
end