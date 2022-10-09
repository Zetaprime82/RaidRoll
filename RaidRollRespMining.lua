RaidRoll_RollItemList = {};
RaidRoll_RollItemList.count = 0;
RaidRoll_RollStatus = false;
RaidRoll_RollStatus_timer = false;
RaidRoll_RollItemID = 0;

RaidRoll_RespMining_MainForm = CreateFrame("Frame", "RaidRoll_RespMining_MainForm", UIParent, "BasicFrameTemplate")
RaidRoll_RespMining_MainForm.views = true;



function Add_RollItemList(item,from)
    RaidRoll_RollItemList.count = RaidRoll_RollItemList.count+1;
    RaidRoll_RollItemList[RaidRoll_RollItemList.count] = {};
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].item = item;
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].RollerList = Get_RollerList();
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].from = from;
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].win = {};
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].status = 0;
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].date = date("%d.%m.%y %H:%M:%S");
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].time = time();
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].rollStatus = true;
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].rollList = {};
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].rollList.count = 0;
    RaidRoll_RollItemList[RaidRoll_RollItemList.count].ui = {};
    Save_BD_RollItemList()
    Print_RollItemList()
end
function Clear_AllRollList()
    Clear_RollItemListFrame()
    RaidRoll_RollItemList = {};
    RaidRoll_RollItemList.count = 0;
    RaidRollDB.RaidRoll_RollItemList = nil;
end
function Save_BD_RollItemList()
    if(RaidRollDB.setting.SaveOn) then
        local buf = {};
        local countSave = RaidRoll_RollItemList.count;
        if countSave > tonumber(RaidRollDB.setting.CountSaveRoll) then
            countSave = tonumber(RaidRollDB.setting.CountSaveRoll);
        end
        buf.count = countSave;
        local j = countSave;
        for i = RaidRoll_RollItemList.count, RaidRoll_RollItemList.count-countSave+1, -1 do
            buf[j] = {};
            buf[j].item =  RaidRoll_RollItemList[i].item;
            buf[j].from = RaidRoll_RollItemList[i].from;
            buf[j].win = RaidRoll_RollItemList[i].win;
            buf[j].status = RaidRoll_RollItemList[i].status;
            buf[j].date = RaidRoll_RollItemList[i].date;
            buf[j].time = RaidRoll_RollItemList[i].time;
            buf[j].rollStatus = RaidRoll_RollItemList[i].rollStatus;
            if RaidRollDB.setting.SaveRoll then
                buf[j].RollerList =  RaidRoll_RollItemList[i].RollerList;
                buf[j].rollList = RaidRoll_RollItemList[i].rollList;
                buf[j].rollList.count = RaidRoll_RollItemList[i].rollList.count;
            else
                buf[j].RollerList = {};
                buf[j].rollList = {};
                buf[j].rollList.count = 0;
            end
            buf[j].ui = nil;
            buf[j].ui = {};
            j = j - 1;
        end

        RaidRollDB.RaidRoll_RollItemList = buf;
    end
end
function Add_NewRoll(name,roll)
    if RaidRoll_RollStatus then
        RaidRoll_RollItemList[RaidRoll_RollItemID].rollList.count = RaidRoll_RollItemList[RaidRoll_RollItemID].rollList.count +1
        RaidRoll_RollItemList[RaidRoll_RollItemID].rollList[RaidRoll_RollItemList[RaidRoll_RollItemID].rollList.count] = {}
        RaidRoll_RollItemList[RaidRoll_RollItemID].rollList[RaidRoll_RollItemList[RaidRoll_RollItemID].rollList.count].name = name;
        RaidRoll_RollItemList[RaidRoll_RollItemID].rollList[RaidRoll_RollItemList[RaidRoll_RollItemID].rollList.count].roll = roll;
    end
    Sort_RollList(RaidRoll_RollItemID);
    Print_RollList(RaidRoll_RollItemID);
end
function Clear_RollList(id)
    RaidRoll_RollItemList[id].rollList = {};
    RaidRoll_RollItemList[id].rollList.count = 0;
end
function Print_RollItemList()
    local MarginTop = 3;
    Clear_RollItemListFrame();
    local CountViews = RaidRoll_RollItemList.count;
    if CountViews > tonumber(RaidRollDB.setting.CountViewsRoll) then
        CountViews = tonumber(RaidRollDB.setting.CountViewsRoll);
    end
    for i = RaidRoll_RollItemList.count, RaidRoll_RollItemList.count - CountViews+1, -1 do
        if RaidRoll_RollItemList[i].status == 0 then
            if not RaidRoll_RollItemList[i].ui.panel then
                RaidRoll_RollItemList[i].ui.panel = CreateFrame("Frame", "RaidRoll_RespMining_ItemForm", RaidRoll_RespMining_ItemListForm, BackdropTemplateMixin and "BackdropTemplate")
                RaidRoll_RollItemList[i].ui.panel:ClearAllPoints()
                RaidRoll_RollItemList[i].ui.panel:SetSize(300, 60)
                RaidRoll_RollItemList[i].ui.panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
                RaidRoll_RollItemList[i].ui.panel:SetPoint("TOPLEFT", 4, -MarginTop)
                RaidRoll_RollItemList[i].ui.panel:SetScript("OnEnter", function(self)
                RaidRoll_RollItemList[i].ui.panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal-Desaturated",  tile = false,});
                end)
                RaidRoll_RollItemList[i].ui.panel:SetScript("OnLeave", function(self)
                RaidRoll_RollItemList[i].ui.panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
                end)
                RaidRoll_RollItemList[i].ui.bgtitle = CreateFrame("Frame", "RaidRoll_RespMining_ItemForm", RaidRoll_RollItemList[i].ui.panel, BackdropTemplateMixin and "BackdropTemplate")
                RaidRoll_RollItemList[i].ui.bgtitle:ClearAllPoints()
                RaidRoll_RollItemList[i].ui.bgtitle:SetSize(300, 20)
                RaidRoll_RollItemList[i].ui.bgtitle:SetPoint("TOPLEFT", 0, 0)
                RaidRoll_RollItemList[i].ui.bgtitle:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
                RaidRoll_RollItemList[i].ui.bgtitle:SetBackdropColor(0, 0, 0, 0.8)

                RaidRoll_RollItemList[i].ui.icon = CreateFrame("Button", nil, RaidRoll_RollItemList[i].ui.panel, "GameMenuButtonTemplate")
                RaidRoll_RollItemList[i].ui.icon:SetPoint("LEFT", RaidRoll_RollItemList[i].ui.panel, "LEFT", 3, 0)
                RaidRoll_RollItemList[i].ui.icon:SetSize(50, 50)
                RaidRoll_RollItemList[i].ui.icon.overlay = RaidRoll_RollItemList[i].ui.icon:CreateTexture(nil, "OVERLAY")
                RaidRoll_RollItemList[i].ui.icon.overlay:SetPoint("LEFT", RaidRoll_RollItemList[i].ui.panel, "LEFT", 3, 0)
                RaidRoll_RollItemList[i].ui.icon.overlay:SetSize(50, 50)
                RaidRoll_RollItemList[i].ui.icon:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
                end)
                RaidRoll_RollItemList[i].ui.title = RaidRoll_RollItemList[i].ui.bgtitle:CreateFontString(nil, "OVERLAY", RaidRoll_RollItemList[i].ui.bgtitle)
                RaidRoll_RollItemList[i].ui.title:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
                RaidRoll_RollItemList[i].ui.title:SetPoint("TOPLEFT", 55, -2)
                RaidRoll_RollItemList[i].ui.title:SetJustifyH("LEFT")
                RaidRoll_RollItemList[i].ui.title:Show();


                RaidRoll_RollItemList[i].ui.date = RaidRoll_RollItemList[i].ui.panel:CreateFontString(nil, "OVERLAY", RaidRoll_RollItemList[i].ui.panel)
                RaidRoll_RollItemList[i].ui.date:SetFont("Fonts\\ARIALN.ttf", 9)
                RaidRoll_RollItemList[i].ui.date:SetPoint("TOPLEFT", 190, -48)
                RaidRoll_RollItemList[i].ui.date:SetJustifyH("LEFT")
                RaidRoll_RollItemList[i].ui.date:Show();

                RaidRoll_RollItemList[i].ui.win = RaidRoll_RollItemList[i].ui.panel:CreateFontString(nil, "OVERLAY", RaidRoll_RollItemList[i].ui.panel)
                RaidRoll_RollItemList[i].ui.win:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
                RaidRoll_RollItemList[i].ui.win:SetPoint("TOPLEFT", 55, -21)
                RaidRoll_RollItemList[i].ui.win:SetJustifyH("LEFT")
                RaidRoll_RollItemList[i].ui.win:Show();

                RaidRoll_RollItemList[i].ui.author = RaidRoll_RollItemList[i].ui.panel:CreateFontString(nil, "OVERLAY", RaidRoll_RollItemList[i].ui.panel)
                RaidRoll_RollItemList[i].ui.author:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
                RaidRoll_RollItemList[i].ui.author:SetPoint("TOPLEFT", 55, -35)
                RaidRoll_RollItemList[i].ui.author:SetJustifyH("LEFT")
                RaidRoll_RollItemList[i].ui.author:Show();

                RaidRoll_RollItemList[i].ui.newIcon = CreateFrame("Frame", "RaidRoll_RespMining_ItemForm", RaidRoll_RollItemList[i].ui.panel, BackdropTemplateMixin and "BackdropTemplate")
                RaidRoll_RollItemList[i].ui.newIcon:ClearAllPoints()
                RaidRoll_RollItemList[i].ui.newIcon:SetSize(60, 60)
                RaidRoll_RollItemList[i].ui.newIcon:SetBackdrop({bgFile = "Interface/GLUES/CHARACTERCREATE/NewCharacterNotification",  tile = false,});
                RaidRoll_RollItemList[i].ui.newIcon:SetPoint("TOPLEFT", -10, 40)
                RaidRoll_RollItemList[i].ui.newIcon:Hide();
            end
            RaidRoll_RollItemList[i].ui.panel:Show();
            RaidRoll_RollItemList[i].ui.panel:SetScript("OnMouseDown", function(self)
                Open_RaidRoll_RespMining_RollItemInfo(i);
            end)
            RaidRoll_RollItemList[i].ui.panel:SetPoint("TOPLEFT", 4, -MarginTop)
            RaidRoll_RollItemList[i].ui.icon.overlay:SetTexture(GetItemIcon(RaidRoll_RollItemList[i].item))
            RaidRoll_RollItemList[i].ui.icon:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:ClearLines()
                local _, id = GetItemInfo(tostring(RaidRoll_RollItemList[i].item))
                GameTooltip:SetHyperlink(id)
                GameTooltip:Show()
            end)
            RaidRoll_RollItemList[i].ui.title:SetText("|cffffffff"..RaidRoll_RollItemList[i].item);
            RaidRoll_RollItemList[i].ui.date:SetText("|cffffffff"..RaidRoll_RollItemList[i].date);
            if(RaidRoll_RollItemList[i].win.name) then
                RaidRoll_RollItemList[i].ui.win:SetText("|cffffffff"..Setting.Localization.Win..":"..RaidRoll_RollItemList[i].win.name);
            else
                RaidRoll_RollItemList[i].ui.win:SetText("|cffffffff"..Setting.Localization.Win..":There is not");
            end
            if RaidRoll_RollItemList[i].rollStatus and (time() - RaidRoll_RollItemList[i].time) <= 10800 then
                RaidRoll_RollItemList[i].ui.newIcon:Show();
            else
                RaidRoll_RollItemList[i].ui.newIcon:Hide();
            end
            RaidRoll_RollItemList[i].ui.author:SetText("|cffffffff"..Setting.Localization.Owner..":"..RaidRoll_RollItemList[i].from);
            MarginTop = MarginTop + 64;

        end
    end
    RaidRoll_RespMining_ItemListForm:SetSize(300, MarginTop+54)
    end
function Print_RollItemInfo(id)
    RaidRoll_RespMining_RollItemInfo.icon.overlay:SetTexture(GetItemIcon(RaidRoll_RollItemList[id].item))
    RaidRoll_RespMining_RollItemInfo.icon:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()
        local _, id = GetItemInfo(tostring(RaidRoll_RollItemList[id].item))
        GameTooltip:SetHyperlink(id)
        GameTooltip:Show()
    end)
    RaidRoll_RespMining_RollItemInfo.start:SetScript("OnMouseDown", function(self)
        if not RaidRoll_RollStatus then
            RollStart(id);
        end

    end)
    RaidRoll_RespMining_RollItemInfo.back:SetScript("OnMouseDown", function(self)
        Open_RaidRoll_RespMining_ScrollFrame(id);
        Print_RollItemList()
    end)
    RaidRoll_RespMining_RollItemInfo.dell:SetScript("OnMouseDown", function(self)
        StaticPopup_Show ("EXAMPLE_DELL_ITEM");
        StaticPopupDialogs["EXAMPLE_DELL_ITEM"] = {
            text = Setting.Localization.PopupDellItem,
            button1 = Setting.Localization.PopupYes,
            button2 = Setting.Localization.PopupNo,
            OnAccept = function()
                Clear_RollItemListFrame();
                Open_RaidRoll_RespMining_ScrollFrame(id);
                Dell_ItemRoll(id);
                Print_RollItemList()
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
    end)
    if RaidRoll_RollItemList[id].rollList.count > 0 then
        Print_RollList(id);
    end
end
function Dell_ItemRoll(id)
        local buf = {};
        local j = 1;
        for i = 1, RaidRoll_RollItemList.count, 1 do
            if(i ~= id)then
                buf[j] = {};
                buf[j].item =  RaidRoll_RollItemList[i].item;
                buf[j].from = RaidRoll_RollItemList[i].from;
                buf[j].win = RaidRoll_RollItemList[i].win;
                buf[j].status = RaidRoll_RollItemList[i].status;
                buf[j].date = RaidRoll_RollItemList[i].date;
                buf[j].time = RaidRoll_RollItemList[i].time;
                buf[j].rollStatus = RaidRoll_RollItemList[i].rollStatus;
                buf[j].RollerList =  RaidRoll_RollItemList[i].RollerList;
                buf[j].rollList = RaidRoll_RollItemList[i].rollList;
                buf[j].rollList.count = RaidRoll_RollItemList[i].rollList.count;
                buf[j].ui = nil;
                buf[j].ui = {};
                j = j+1;
            end
        end
        RaidRoll_RollItemList = buf;
        RaidRoll_RollItemList.count = j-1;
        Save_BD_RollItemList();
end
function Print_RollList(id)
    local MarginTop = 3;
    Clear_RollListFrame(id);
    for i = 1, RaidRoll_RollItemList[id].rollList.count, 1 do
        if not RaidRoll_RespMining_RollItemInfo[i] then
            RaidRoll_RespMining_RollItemInfo[i] = {};
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame = {};
        end
        if not RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel then
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo.rollListFrame, BackdropTemplateMixin and "BackdropTemplate")
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:ClearAllPoints()
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:SetSize(270, 30)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:SetPoint("TOPLEFT", 4, -MarginTop)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",
                                                                              tile = false, tileSize = 60, edgeSize = 10,});
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.ToggleDropDownMenu = CreateFrame("FRAME", "WPDemoContextMenu", UIParent, "UIDropDownMenuTemplate")
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:SetScript("OnEnter", function(self)
                RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal-Desaturated",  tile = false,});
            end)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:SetScript("OnLeave", function(self)
                RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
            end)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:SetScript("OnMouseDown", function(self)
                ToggleDropDownMenu(1, nil, RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.ToggleDropDownMenu, "cursor", 3, -3)
            end)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.title = RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.title:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 14)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.title:SetPoint("TOPLEFT", 35, -6)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.title:SetJustifyH("LEFT")
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.title:Show();

            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.roll = RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.roll:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 14)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.roll:SetPoint("TOPLEFT", 235, -6)
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.roll:SetJustifyH("LEFT")
            RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.roll:Show();
        end
        UIDropDownMenu_Initialize(RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.ToggleDropDownMenu, function(self, level, menuList)
            local info = UIDropDownMenu_CreateInfo()
            info.func = Roll_User_End;
            info.text, info.arg1, info.arg2, info.checked = Setting.Localization.WinUser, i, id, true;
            UIDropDownMenu_AddButton(info)
        end)
        RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:Show();
        RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.title:SetText("|cffffffff"..RaidRoll_RollItemList[id].rollList[i].name)
        RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel.roll:SetText("|cffffffff"..RaidRoll_RollItemList[id].rollList[i].roll)
        MarginTop = MarginTop + 33;
    end
end
function RollStart(id)
    RaidRoll_RollStatus = true;
    if(RaidRollDB.setting.TimerOn) then
        if(RaidRollDB.setting.TimerAutoStartOn) then
            timerRoll = GetTime()+RaidRollDB.setting.TimerCountSec;
            timer30s = timerRoll-GetTime()- RaidRollDB.setting.TimerCountSecAnons;
            RaidRoll_RollStatus_timer = true;
        else
            RaidRoll_RespMining_RollItemInfo.reRoll.Text:SetText("|cffffffff"..Setting.Localization.timer);
            RaidRoll_RespMining_RollItemInfo.reRoll:SetScript("OnMouseDown", function(self)
                Anons_RollRaidOrGroup(Setting.Localization.timerRollEnd..' '..RaidRoll_RollItemList[RaidRoll_RollItemID].item..' '..Setting.Localization.timerRollOst..(RaidRollDB.setting.TimerCountSec)..' '..Setting.Localization.seconds)
                timerRoll = GetTime()+RaidRollDB.setting.TimerCountSec;
                timer30s = timerRoll-GetTime()- RaidRollDB.setting.TimerCountSecAnons;
                RaidRoll_RollStatus_timer = true;
                RaidRoll_RespMining_RollItemInfo.reRoll.Text:SetText("|cffffffff"..Setting.Localization.timer);
                RaidRoll_RespMining_RollItemInfo.reRoll:SetScript("OnMouseDown",nil);
            end)
        end
    end

    RaidRoll_RollItemID = id;
    Clear_RollListFrame(id);
    Clear_RollList(id);
    RaidRoll_RollItemList[id].rollStatus = false;
    RaidRoll_RespMining_RollItemInfo.back:Hide();
    RaidRoll_RespMining_RollItemInfo.start:SetScript("OnMouseDown",nil);
    RaidRoll_RespMining_RollItemInfo.start.Text:SetText("|cffffffff"..Setting.Localization.Start);
    RaidRoll_RespMining_RollItemInfo.finish.Text:SetText("|cffffffff"..Setting.Localization.End);
    RaidRoll_RespMining_RollItemInfo.finish:SetScript("OnMouseDown", function(self)
        RollEnd(id);
    end)
    local text = Setting.Localization.Roll.." "..RaidRoll_RollItemList[id].item;
    Anons_RollRaidOrGroup(text)
end
function RollEnd(id)
    RaidRoll_RollStatus = false;
    RaidRoll_RollStatus_timer = false;
    RaidRoll_RollItemID = id;
    RaidRoll_RespMining_RollItemInfo.back:Show();
    RaidRoll_RespMining_RollItemInfo.finish:SetScript("OnMouseDown",nil);
    RaidRoll_RespMining_RollItemInfo.start.Text:SetText("|cffffffff"..Setting.Localization.Start);
    RaidRoll_RespMining_RollItemInfo.finish.Text:SetText("|cffffffff"..Setting.Localization.End);
    RaidRoll_RespMining_RollItemInfo.reRoll.Text:SetText("|cffffffff"..Setting.Localization.timer);
    RaidRoll_RespMining_RollItemInfo.reRoll:SetScript("OnMouseDown",nil);
    RaidRoll_RespMining_RollItemInfo.start:SetScript("OnMouseDown", function(self)
        RollStart(id);
    end)
    Get_WinRollItem(id);
    if RaidRoll_RollItemList[id].win.name then
        if RaidRoll_RollItemList[id].RollerList[RaidRoll_RollItemList[id].win.name] then
            Anons_RollRaidOrGroup(RaidRoll_RollItemList[id].RollerList[RaidRoll_RollItemList[id].win.name]["fullName"]..Setting.Localization.TextWin..RaidRoll_RollItemList[id].item..Setting.Localization.TextWinRoll..RaidRoll_RollItemList[id].win.roll);
            Anons_Personal_Message(RaidRoll_RollItemList[id].from,RaidRoll_RollItemList[id].RollerList[RaidRoll_RollItemList[id].win.name]["fullName"]..Setting.Localization.TextWinRollPls..RaidRoll_RollItemList[id].item..Setting.Localization.TextHim);
            Anons_Personal_Message(RaidRoll_RollItemList[id].RollerList[RaidRoll_RollItemList[id].win.name]["fullName"],Setting.Localization.TextYouWin..RaidRoll_RollItemList[id].item..Setting.Localization.TextExchange..RaidRoll_RollItemList[id].from);
        end
    else
        Anons_RollRaidOrGroup(Setting.Localization.RollEnd);
    end
    Save_BD_RollItemList()
end
function Roll_User_End(self,roll_id,item_id)
    RaidRoll_RollStatus = false;
    RaidRoll_RollItemID = item_id;
    RaidRoll_RespMining_RollItemInfo.back:Show();
    RaidRoll_RespMining_RollItemInfo.finish:SetScript("OnMouseDown",nil);
    RaidRoll_RespMining_RollItemInfo.start.Text:SetText("|cffffffff"..Setting.Localization.Start);
    RaidRoll_RespMining_RollItemInfo.finish.Text:SetText("|cffffffff"..Setting.Localization.End);
    RaidRoll_RespMining_RollItemInfo.start:SetScript("OnMouseDown", function(self)
        RollStart(item_id);
    end)
    if RaidRoll_RollItemList[item_id].rollList[roll_id] then
        RaidRoll_RollItemList[item_id].win = RaidRoll_RollItemList[item_id].rollList[roll_id];
    end
    if RaidRoll_RollItemList[item_id].win.name then
        if RaidRoll_RollItemList[item_id].RollerList[RaidRoll_RollItemList[item_id].win.name] then
            Anons_RollRaidOrGroup(RaidRoll_RollItemList[item_id].win.name..Setting.Localization.TextWin..RaidRoll_RollItemList[item_id].item..Setting.Localization.TextWinRoll..RaidRoll_RollItemList[item_id].win.roll);
            Anons_Personal_Message(RaidRoll_RollItemList[item_id].from,RaidRoll_RollItemList[item_id].RollerList[RaidRoll_RollItemList[item_id].win.name]["fullName"]..Setting.Localization.TextWinRollPls..RaidRoll_RollItemList[item_id].item..Setting.Localization.TextHim);
            Anons_Personal_Message(RaidRoll_RollItemList[item_id].RollerList[RaidRoll_RollItemList[item_id].win.name]["fullName"],Setting.Localization.TextYouWin..RaidRoll_RollItemList[item_id].item..Setting.Localization.TextExchange..RaidRoll_RollItemList[item_id].from);
        end
    else
        print("No porrolled")
    end
    Save_BD_RollItemList()
end
function Get_WinRollItem(id)
    if RaidRoll_RollItemList[id].rollList[1] then
        RaidRoll_RollItemList[id].win = RaidRoll_RollItemList[id].rollList[1];
    end
end
function Clear_RollItemListFrame()
        for i = 1, RaidRoll_RollItemList.count, 1 do
            if RaidRoll_RollItemList[i].ui.panel then
                RaidRoll_RollItemList[i].ui.panel:Hide();
            end
        end
end
function Clear_RollListFrame(id)
        for i = 1, RaidRoll_RollItemList[id].rollList.count, 1 do
            if RaidRoll_RespMining_RollItemInfo[i] then
                RaidRoll_RespMining_RollItemInfo[i].rollListFrame.Panel:Hide();
            end
        end
end
function Anons_RollRaidOrGroup(text)
    if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) or IsInRaid(LE_PARTY_CATEGORY_INSTANCE) then
        channel = "INSTANCE_CHAT"
    elseif IsInRaid(0) then
        channel = "RAID_WARNING"
    elseif IsInGroup(0) then
        channel = "PARTY"
    else
        channel = "SAY"
    end
    if channel then
        SendChatMessage(text, channel)
    end
end
function Anons_Personal_Message(sender,text)
    SendChatMessage(text, "WHISPER", "Common", sender)
end
function SearchUserRollItem(name)
    for i = 1, RaidRoll_RollItemList[RaidRoll_RollItemID].rollList.count, 1 do
        if RaidRoll_RollItemList[RaidRoll_RollItemID].rollList[i].name == name then
            return false;
        end
    end
    return true
end