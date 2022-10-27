RaidRoll_SimpleUser_Item = {};
RaidRoll_SimpleUser_Item.item = {};
RaidRoll_SimpleUser_Item.RollList = {};
RaidRoll_SimpleUser_Item.RollList.count = 0;
RaidRoll_SimpleUser_Item.RollerList = {};
RaidRoll_SimpleUser_Item.RollListFrame = {};
RaidRoll_SimpleUser_RollStatus = false;

function SimpleUser_Add_RollItem(item,from)
    SimpleUser_ClearRollListFrame();
    RaidRoll_SimpleUser_Item.item = item;
    RaidRoll_SimpleUser_Item.Time = GetTime();
    RaidRoll_SimpleUser_Item.RollerList = Get_RollerList();
    RaidRoll_SimpleUser_Item.RollList = {};
    RaidRoll_SimpleUser_Item.RollList.count = 0;
    RaidRoll_SimpleUser_Item.RollListFrame = {};
    SimpleUser_RollStart();
    RaidRoll_SimpleUser_RollStatus = true;
end
function SimpleUser_Add_NewRoll(name,roll)
    if(GetTime() - RaidRoll_SimpleUser_Item.Time < 140) then
        RaidRoll_SimpleUser_Item.RollList.count = RaidRoll_SimpleUser_Item.RollList.count+1;
        RaidRoll_SimpleUser_Item.RollList[RaidRoll_SimpleUser_Item.RollList.count] ={};
        RaidRoll_SimpleUser_Item.RollList[RaidRoll_SimpleUser_Item.RollList.count].name =name;
        RaidRoll_SimpleUser_Item.RollList[RaidRoll_SimpleUser_Item.RollList.count].roll =roll;
        if(RaidRoll_SimpleUser_Item.RollList.count == 1) then
            SimpleUser_RollStart();
        end
        SimpleUser_SortRollList();
        SimpleUser_PrintRollList()
    else
        RaidRoll_SimpleUser_RollStatus = false;
    end
end
function SimpleUser_RollStart()
    simpleUserWindow.ui.title:SetText(RaidRoll_SimpleUser_Item.item);
    simpleUserWindow.ui.icon.overlay:SetTexture(GetItemIcon(RaidRoll_SimpleUser_Item.item))
    simpleUserWindow.ui.icon:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()
        local _, id = GetItemInfo(tostring(RaidRoll_SimpleUser_Item.item))
        GameTooltip:SetHyperlink(id)
        GameTooltip:Show()
    end)
end
function SimpleUser_PrintRollList()
    local MarginTop = 3;
    SimpleUser_ClearRollListFrame();
    for i = 1, RaidRoll_SimpleUser_Item.RollList.count, 1 do
        RaidRoll_SimpleUser_Item.RollListFrame[i] = {};
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", simpleUserWindow.rollListFrame, BackdropTemplateMixin and "BackdropTemplate")
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:ClearAllPoints()
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:SetSize(270, 30)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:SetPoint("TOPLEFT", 4, -MarginTop)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",
                                                                             tile = false, tileSize = 60, edgeSize = 10,});
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.ToggleDropDownMenu = CreateFrame("FRAME", "WPDemoContextMenu", UIParent, "UIDropDownMenuTemplate")
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:SetScript("OnEnter", function(self)
            RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal-Desaturated",  tile = false,});
        end)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:SetScript("OnLeave", function(self)
            RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
        end)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:SetScript("OnMouseDown", function(self)
            ToggleDropDownMenu(1, nil, RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.ToggleDropDownMenu, "cursor", 3, -3)
        end)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.title = RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:CreateFontString(nil, "OVERLAY", RaidRoll_SimpleUser_Item.RollListFrame[i].Panel)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.title:SetFont("Fonts\\arialn.ttf", 14)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.title:SetPoint("TOPLEFT", 35, -6)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.title:SetJustifyH("LEFT")
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.title:Show();

        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.roll = RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:CreateFontString(nil, "OVERLAY", RaidRoll_SimpleUser_Item.RollListFrame[i].Panel)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.roll:SetFont("Fonts\\arialn.ttf", 14)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.roll:SetPoint("TOPLEFT", 170, -6)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.roll:SetJustifyH("LEFT")
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.roll:Show();


        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:Show();
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.title:SetText("|cFF040301"..RaidRoll_SimpleUser_Item.RollList[i].name)
        RaidRoll_SimpleUser_Item.RollListFrame[i].Panel.roll:SetText("|cFF040301"..RaidRoll_SimpleUser_Item.RollList[i].roll)
        MarginTop = MarginTop + 33;
    end
end
function SimpleUser_ClearRollListFrame()
    for i = 1, RaidRoll_SimpleUser_Item.RollList.count, 1 do
        if RaidRoll_SimpleUser_Item.RollListFrame[i] then
            RaidRoll_SimpleUser_Item.RollListFrame[i].Panel:Hide();
        end
    end
end
function SimpleUser_SortRollList()
    if RaidRoll_SimpleUser_Item.RollList.count > 1 then
        for i = 1, RaidRoll_SimpleUser_Item.RollList.count do
            for j = 1,RaidRoll_SimpleUser_Item.RollList.count-i do
                if (RaidRoll_SimpleUser_Item.RollList[j+1].roll > RaidRoll_SimpleUser_Item.RollList[j].roll) then
                    NewRaidRollItemList = RaidRoll_SimpleUser_Item.RollList[j+1]
                    RaidRoll_SimpleUser_Item.RollList[j+1] = RaidRoll_SimpleUser_Item.RollList[j];
                    RaidRoll_SimpleUser_Item.RollList[j] = NewRaidRollItemList;
                end
            end
        end
    end
end
function SimpleUser_SearchRoller(name)
    for i = 1, RaidRoll_SimpleUser_Item.RollList.count, 1 do
        if(RaidRoll_SimpleUser_Item.RollList[i].name == name)then
            return false;
        end
    end
    return true;
end
