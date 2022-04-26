RaidRoll_RespMining_MainForm:ClearAllPoints()
RaidRoll_RespMining_MainForm:SetSize(300, 430)
RaidRoll_RespMining_MainForm:SetPoint("CENTER", UIParent, "CENTER")
RaidRoll_RespMining_MainForm:SetMovable(true)
RaidRoll_RespMining_MainForm:EnableMouse(true)
RaidRoll_RespMining_MainForm:SetUserPlaced(true)
RaidRoll_RespMining_MainForm:SetScript("OnMouseDown", RaidRoll_RespMining_MainForm.StartMoving)
RaidRoll_RespMining_MainForm:SetScript("OnMouseUp", RaidRoll_RespMining_MainForm.StopMovingOrSizing)
RaidRoll_RespMining_MainForm.icon = {}

RaidRoll_RespMining_MainForm.title = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_MainForm, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_MainForm.title:ClearAllPoints()
RaidRoll_RespMining_MainForm.title:SetSize(200, 50)
RaidRoll_RespMining_MainForm.title:SetPoint("TOP", 0, 14)

RaidRoll_RespMining_MainForm.title.Text = RaidRoll_RespMining_MainForm.title:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.title)
RaidRoll_RespMining_MainForm.title.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.title.Text:SetPoint("CENTER", 2, 0)
RaidRoll_RespMining_MainForm.title.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.title.Text:SetText("Raid Roll")
RaidRoll_RespMining_MainForm.title.Text:Show();
RaidRoll_RespMining_MainForm:Hide();
RaidRoll_RespMining_ScrollFrame = CreateFrame("ScrollFrame", "RaidRoll_RespMining_ScrollFrame", RaidRoll_RespMining_MainForm, "UIPanelScrollFrameTemplate")
RaidRoll_RespMining_ScrollFrame:SetWidth(270)
RaidRoll_RespMining_ScrollFrame:SetHeight(400)
RaidRoll_RespMining_ScrollFrame:SetPoint("TOPLEFT", 0, -25)
RaidRoll_RespMining_ItemListForm = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_MainForm, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_ItemListForm:ClearAllPoints()
RaidRoll_RespMining_ItemListForm:SetSize(300, 600)
RaidRoll_RespMining_ItemListForm:SetPoint("CENTER", UIParent, "CENTER")
RaidRoll_RespMining_ScrollFrame:SetScrollChild(RaidRoll_RespMining_ItemListForm)
RaidRoll_RespMining_ScrollFrame:Show();


RaidRoll_RespMining_RollItemInfo = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_MainForm, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo:ClearAllPoints()
RaidRoll_RespMining_RollItemInfo:SetSize(300, 400)
RaidRoll_RespMining_RollItemInfo:SetPoint("TOPLEFT", 0, -25)
RaidRoll_RespMining_RollItemInfo:Hide();

local RaidRoll_RespMining_ScrollRollItemFrame = CreateFrame("ScrollFrame", "RaidRoll_RespMining_ScrollFrame", RaidRoll_RespMining_RollItemInfo, "UIPanelScrollFrameTemplate")
RaidRoll_RespMining_ScrollRollItemFrame:SetWidth(270)
RaidRoll_RespMining_ScrollRollItemFrame:SetHeight(250)
RaidRoll_RespMining_ScrollRollItemFrame:SetPoint("TOPLEFT", 0, -150)

RaidRoll_RespMining_RollItemInfo.rollListFrame = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo.rollListFrame:ClearAllPoints()
RaidRoll_RespMining_RollItemInfo.rollListFrame:SetSize(300, 600)
RaidRoll_RespMining_RollItemInfo.rollListFrame:SetPoint("CENTER", UIParent, "CENTER")
RaidRoll_RespMining_ScrollRollItemFrame:SetScrollChild(RaidRoll_RespMining_RollItemInfo.rollListFrame)



RaidRoll_RespMining_RollItemInfo.icon = CreateFrame("Button", nil, RaidRoll_RespMining_RollItemInfo, "GameMenuButtonTemplate")
RaidRoll_RespMining_RollItemInfo.icon:SetPoint("TOPLEFT", RaidRoll_RespMining_RollItemInfo, "TOPLEFT", 130, -20)
RaidRoll_RespMining_RollItemInfo.icon:SetSize(50, 50)
RaidRoll_RespMining_RollItemInfo.icon.overlay = RaidRoll_RespMining_RollItemInfo.icon:CreateTexture(nil, "OVERLAY")
RaidRoll_RespMining_RollItemInfo.icon.overlay:SetPoint("TOPLEFT", RaidRoll_RespMining_RollItemInfo.icon, "TOPLEFT", 0, 0)
RaidRoll_RespMining_RollItemInfo.icon.overlay:SetSize(50, 50)
RaidRoll_RespMining_RollItemInfo.icon.overlay:SetTexture(GetItemIcon(6948))
RaidRoll_RespMining_RollItemInfo.icon:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    local _, id = GetItemInfo(6948)
    GameTooltip:SetHyperlink(id)
    GameTooltip:Show()
end)
RaidRoll_RespMining_RollItemInfo.icon:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)
RaidRoll_RespMining_RollItemInfo.icon.panel = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo.icon, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo.icon.panel:ClearAllPoints()
RaidRoll_RespMining_RollItemInfo.icon.panel:SetSize(280, 140)
RaidRoll_RespMining_RollItemInfo.icon.panel:SetPoint("CENTER", -2, 0)
RaidRoll_RespMining_RollItemInfo.icon.panel:SetBackdrop({bgFile = "Interface/ExtraButton/BrewmoonKeg", tile = false, tileSize = 60, edgeSize = 10,});


RaidRoll_RespMining_RollItemInfo.start = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo.start:SetSize(100, 30)
RaidRoll_RespMining_RollItemInfo.start:SetPoint("TOPLEFT", -2, -90)
RaidRoll_RespMining_RollItemInfo.start:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});

RaidRoll_RespMining_RollItemInfo.start:SetScript("OnEnter", function(self)
    RaidRoll_RespMining_RollItemInfo.start:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab1-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});
end)
RaidRoll_RespMining_RollItemInfo.start:SetScript("OnLeave", function(self)
    RaidRoll_RespMining_RollItemInfo.start:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});
end)
RaidRoll_RespMining_RollItemInfo.start.Text = RaidRoll_RespMining_RollItemInfo.start:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_RollItemInfo.start)
RaidRoll_RespMining_RollItemInfo.start.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_RollItemInfo.start.Text:SetPoint("CENTER", 2, 5)
RaidRoll_RespMining_RollItemInfo.start.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_RollItemInfo.start.Text:Show();

RaidRoll_RespMining_RollItemInfo.finish = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo.finish:ClearAllPoints()
RaidRoll_RespMining_RollItemInfo.finish:SetSize(100, 50)
RaidRoll_RespMining_RollItemInfo.finish:SetPoint("TOPLEFT", -2, -110)
RaidRoll_RespMining_RollItemInfo.finish:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected", tile = false, tileSize = 0, edgeSize = 0});
RaidRoll_RespMining_RollItemInfo.finish:SetScript("OnEnter", function(self)
    RaidRoll_RespMining_RollItemInfo.finish:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab1-Selected",  tile = false,});
end)
RaidRoll_RespMining_RollItemInfo.finish:SetScript("OnLeave", function(self)
    RaidRoll_RespMining_RollItemInfo.finish:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected",  tile = false,});
end)
RaidRoll_RespMining_RollItemInfo.finish.Text = RaidRoll_RespMining_RollItemInfo.finish:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_RollItemInfo.start)
RaidRoll_RespMining_RollItemInfo.finish.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_RollItemInfo.finish.Text:SetPoint("CENTER", 2, 5)
RaidRoll_RespMining_RollItemInfo.finish.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_RollItemInfo.finish.Text:Show();

RaidRoll_RespMining_RollItemInfo.roll = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo.roll:ClearAllPoints()
RaidRoll_RespMining_RollItemInfo.roll:SetSize(100, 30)
RaidRoll_RespMining_RollItemInfo.roll:SetPoint("TOPLEFT", 195, -90)
RaidRoll_RespMining_RollItemInfo.roll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});
RaidRoll_RespMining_RollItemInfo.roll:SetScript("OnEnter", function(self)
    RaidRoll_RespMining_RollItemInfo.roll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab1-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});
end)
RaidRoll_RespMining_RollItemInfo.roll:SetScript("OnLeave", function(self)
    RaidRoll_RespMining_RollItemInfo.roll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});
end)
RaidRoll_RespMining_RollItemInfo.roll:SetScript("OnMouseDown", function()
    RandomRoll(1, 100)
end)
RaidRoll_RespMining_RollItemInfo.roll.Text = RaidRoll_RespMining_RollItemInfo.roll:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_RollItemInfo.start)
RaidRoll_RespMining_RollItemInfo.roll.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_RollItemInfo.roll.Text:SetPoint("CENTER", 2, 5)
RaidRoll_RespMining_RollItemInfo.roll.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_RollItemInfo.roll.Text:Show();


RaidRoll_RespMining_RollItemInfo.reRoll = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo.reRoll:ClearAllPoints()
RaidRoll_RespMining_RollItemInfo.reRoll:SetSize(100, 50)
RaidRoll_RespMining_RollItemInfo.reRoll:SetPoint("TOPLEFT", 195, -110)
RaidRoll_RespMining_RollItemInfo.reRoll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected", tile = false, tileSize = 60, edgeSize = 10,});
RaidRoll_RespMining_RollItemInfo.reRoll.Text = RaidRoll_RespMining_RollItemInfo.reRoll:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_RollItemInfo.start)
RaidRoll_RespMining_RollItemInfo.reRoll.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_RollItemInfo.reRoll.Text:SetPoint("CENTER", 2, 5)
RaidRoll_RespMining_RollItemInfo.reRoll.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_RollItemInfo.reRoll.Text:Show();
RaidRoll_RespMining_RollItemInfo.reRoll:SetScript("OnEnter", function(self)
    RaidRoll_RespMining_RollItemInfo.reRoll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab1-Selected",  tile = false,});
end)
RaidRoll_RespMining_RollItemInfo.reRoll:SetScript("OnLeave", function(self)
    RaidRoll_RespMining_RollItemInfo.reRoll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected",  tile = false,});
end)

RaidRoll_RespMining_RollItemInfo.back = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo.back:ClearAllPoints()
RaidRoll_RespMining_RollItemInfo.back:SetSize(30, 30)
RaidRoll_RespMining_RollItemInfo.back:SetPoint("TOPLEFT", 1, -1)
RaidRoll_RespMining_RollItemInfo.back:SetBackdrop({bgFile = "Interface/TIMEMANAGER/RWButton", tile = false, tileSize = 60, edgeSize = 10,});

RaidRoll_RespMining_RollItemInfo.dell = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_RollItemInfo, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_RollItemInfo.dell:ClearAllPoints()
RaidRoll_RespMining_RollItemInfo.dell:SetSize(15, 15)
RaidRoll_RespMining_RollItemInfo.dell:SetPoint("TOPRIGHT", -15, -40)
RaidRoll_RespMining_RollItemInfo.dell:SetBackdrop({bgFile = "Interface/Buttons/UI-StopButton", tile = false, tileSize = 60, edgeSize = 10,});


RaidRoll_RespMining_MainForm.setting = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_MainForm, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_MainForm.setting:ClearAllPoints()
RaidRoll_RespMining_MainForm.setting:SetSize(293, 405)
RaidRoll_RespMining_MainForm.setting:SetPoint("TOPLEFT", 2, -22)
RaidRoll_RespMining_MainForm.setting:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-GuildAchievement-Parchment-Horizontal-Desaturated", tile = false, tileSize = 60, edgeSize = 10,});
RaidRoll_RespMining_MainForm.setting:Hide();


RaidRoll_RespMining_MainForm.setting.itemPersonalChat = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.itemPersonalChat:SetPoint("TOPLEFT", 5, -25);
RaidRoll_RespMining_MainForm.setting.itemPersonalChat:SetScript("OnClick", function()
    RaidRollDB.setting.GetItemPM = RaidRoll_RespMining_MainForm.setting.itemPersonalChat:GetChecked()
end)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Text = RaidRoll_RespMining_MainForm.setting.itemPersonalChat:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemPersonalChat)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Text:Show();
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Title = RaidRoll_RespMining_MainForm.setting.itemPersonalChat:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemPersonalChat)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Title:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Title:SetPoint("TOPLEFT", 25, 15)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Title:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Title:Show();
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.TitleItemQ = RaidRoll_RespMining_MainForm.setting.itemPersonalChat:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemPersonalChat)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.TitleItemQ:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.TitleItemQ:SetPoint("TOPLEFT", 25, -35)
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.TitleItemQ:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemPersonalChat.TitleItemQ:Show();

RaidRoll_RespMining_MainForm.setting.itemGetItemPoor = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.itemGetItemPoor:SetPoint("TOPLEFT", 5, -75);
RaidRoll_RespMining_MainForm.setting.itemGetItemPoor:SetScript("OnClick", function()
    RaidRollDB.setting.GetItemQualityPoor = RaidRoll_RespMining_MainForm.setting.itemGetItemPoor:GetChecked()
end)
RaidRoll_RespMining_MainForm.setting.itemGetItemPoor.Text = RaidRoll_RespMining_MainForm.setting.itemGetItemPoor:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemGetItemPoor)
RaidRoll_RespMining_MainForm.setting.itemGetItemPoor.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemGetItemPoor.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.itemGetItemPoor.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemGetItemPoor.Text:Show();

RaidRoll_RespMining_MainForm.setting.itemGetItemCommon = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.itemGetItemCommon:SetPoint("TOPLEFT", 5, -95);
RaidRoll_RespMining_MainForm.setting.itemGetItemCommon:SetScript("OnClick", function()
    RaidRollDB.setting.GetItemQualityCommon = RaidRoll_RespMining_MainForm.setting.itemGetItemCommon:GetChecked()
end)
RaidRoll_RespMining_MainForm.setting.itemGetItemCommon.Text = RaidRoll_RespMining_MainForm.setting.itemGetItemCommon:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemGetItemCommon)
RaidRoll_RespMining_MainForm.setting.itemGetItemCommon.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemGetItemCommon.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.itemGetItemCommon.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemGetItemCommon.Text:Show();

RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon:SetPoint("TOPLEFT", 5, -115);
RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon:SetScript("OnClick", function()
    RaidRollDB.setting.GetItemQualityUncommon = RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon:GetChecked()
end)
RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon.Text = RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon)
RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon.Text:Show();

RaidRoll_RespMining_MainForm.setting.itemGetItemRare = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.itemGetItemRare:SetPoint("TOPLEFT", 5, -135);
RaidRoll_RespMining_MainForm.setting.itemGetItemRare:SetScript("OnClick", function()
    RaidRollDB.setting.GetItemQualityRare = RaidRoll_RespMining_MainForm.setting.itemGetItemRare:GetChecked()
end)
RaidRoll_RespMining_MainForm.setting.itemGetItemRare.Text = RaidRoll_RespMining_MainForm.setting.itemGetItemRare:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemGetItemRare)
RaidRoll_RespMining_MainForm.setting.itemGetItemRare.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemGetItemRare.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.itemGetItemRare.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemGetItemRare.Text:Show();

RaidRoll_RespMining_MainForm.setting.itemGetItemEpic = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.itemGetItemEpic:SetPoint("TOPLEFT", 5, -155);
RaidRoll_RespMining_MainForm.setting.itemGetItemEpic:SetScript("OnClick", function()
    RaidRollDB.setting.GetItemQualityEpic = RaidRoll_RespMining_MainForm.setting.itemGetItemEpic:GetChecked()
end)
RaidRoll_RespMining_MainForm.setting.itemGetItemEpic.Text = RaidRoll_RespMining_MainForm.setting.itemGetItemEpic:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemGetItemEpic)
RaidRoll_RespMining_MainForm.setting.itemGetItemEpic.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemGetItemEpic.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.itemGetItemEpic.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemGetItemEpic.Text:Show();

RaidRoll_RespMining_MainForm.setting.itemGetItemLegend = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.itemGetItemLegend:SetPoint("TOPLEFT", 5, -175);
RaidRoll_RespMining_MainForm.setting.itemGetItemLegend:SetScript("OnClick", function()
    RaidRollDB.setting.GetItemQualityLegend = RaidRoll_RespMining_MainForm.setting.itemGetItemLegend:GetChecked()
end)
RaidRoll_RespMining_MainForm.setting.itemGetItemLegend.Text = RaidRoll_RespMining_MainForm.setting.itemGetItemLegend:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemGetItemLegend)
RaidRoll_RespMining_MainForm.setting.itemGetItemLegend.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemGetItemLegend.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.itemGetItemLegend.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemGetItemLegend.Text:Show();

RaidRoll_RespMining_MainForm.setting.itemGetILvl = CreateFrame( "EditBox", nil, RaidRoll_RespMining_MainForm.setting , "InputBoxTemplate");
RaidRoll_RespMining_MainForm.setting.itemGetILvl:SetPoint("TOPLEFT", 210, -95);
RaidRoll_RespMining_MainForm.setting.itemGetILvl:SetWidth(40)
RaidRoll_RespMining_MainForm.setting.itemGetILvl:SetHeight(20)
RaidRoll_RespMining_MainForm.setting.itemGetILvl:SetAutoFocus(false)
RaidRoll_RespMining_MainForm.setting.itemGetILvl:SetNumeric(true)
RaidRoll_RespMining_MainForm.setting.itemGetILvl:SetMovable(false)
RaidRoll_RespMining_MainForm.setting.itemGetILvl.Text = RaidRoll_RespMining_MainForm.setting.itemGetILvl:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.itemGetILvl)
RaidRoll_RespMining_MainForm.setting.itemGetILvl.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.itemGetILvl.Text:SetPoint("TOPLEFT", -25, 15)
RaidRoll_RespMining_MainForm.setting.itemGetILvl.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.itemGetILvl.Text:Show();
RaidRoll_RespMining_MainForm.setting.itemGetILvl:SetScript("OnTextChanged",function()
    if not (RaidRoll_RespMining_MainForm.setting.itemGetILvl:GetText() == "") then
        if tonumber(RaidRoll_RespMining_MainForm.setting.itemGetILvl:GetText()) > 0 then
            RaidRollDB.setting.GetItemMinILvl = RaidRoll_RespMining_MainForm.setting.itemGetILvl:GetText()
        else
            RaidRollDB.setting.GetItemMinILvl = 1;
        end
    end

end);

RaidRoll_RespMining_MainForm.setting.Language = CreateFrame("FRAME", "WPDemoDropDown", RaidRoll_RespMining_MainForm.setting, "UIDropDownMenuTemplate");
RaidRoll_RespMining_MainForm.setting.Language:SetPoint("TOPLEFT", 0, -375);
RaidRoll_RespMining_MainForm.setting.Language:SetWidth(40);
RaidRoll_RespMining_MainForm.setting.Language:SetHeight(20);
UIDropDownMenu_SetWidth(RaidRoll_RespMining_MainForm.setting.Language, 150);

RaidRoll_RespMining_MainForm.setting.Language.Text = RaidRoll_RespMining_MainForm.setting.Language:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.Language)
RaidRoll_RespMining_MainForm.setting.Language.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 11)
RaidRoll_RespMining_MainForm.setting.Language.Text:SetPoint("TOPLEFT", 50, -7)
RaidRoll_RespMining_MainForm.setting.Language.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.Language.Text:Show();

RaidRoll_RespMining_MainForm.setting.icon = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", RaidRoll_RespMining_MainForm, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_RespMining_MainForm.setting.icon:ClearAllPoints()
RaidRoll_RespMining_MainForm.setting.icon:SetSize(18, 18)
RaidRoll_RespMining_MainForm.setting.icon:SetPoint("TOPLEFT", 5, -1)
RaidRoll_RespMining_MainForm.setting.icon:SetBackdrop({bgFile = "Interface/Scenarios/ScenarioIcon-Interact", tile = false, tileSize = 60, edgeSize = 10,});
RaidRoll_RespMining_MainForm.setting.icon.views = false;
RaidRoll_RespMining_MainForm.setting.icon:SetScript("OnMouseDown", function(self)
    if(not RaidRoll_RollStatus) then
        if (RaidRoll_RespMining_MainForm.setting.icon.views) then
            RaidRoll_RespMining_RollItemInfo:Hide();
            RaidRoll_RespMining_ScrollFrame:Show();
            RaidRoll_RespMining_MainForm.setting:Hide();
            RaidRoll_RespMining_MainForm.setting.icon.views = false;
        else
            RaidRoll_RespMining_RollItemInfo:Hide();
            RaidRoll_RespMining_ScrollFrame:Hide();
            RaidRoll_RespMining_MainForm.setting:Show();
            RaidRoll_RespMining_MainForm.setting.icon.views = true;
        end
    end

end)
RaidRoll_RespMining_MainForm.setting.Save = RaidRoll_RespMining_MainForm.setting:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting)
RaidRoll_RespMining_MainForm.setting.Save:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 11)
RaidRoll_RespMining_MainForm.setting.Save:SetPoint("TOPLEFT", 50, -217)
RaidRoll_RespMining_MainForm.setting.Save:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.Save:Show();

RaidRoll_RespMining_MainForm.setting.Save.On = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.Save.On:SetPoint("TOPLEFT", 5, -227);
RaidRoll_RespMining_MainForm.setting.Save.On:SetScript("OnClick", function()
    RaidRollDB.setting.SaveOn = RaidRoll_RespMining_MainForm.setting.Save.On:GetChecked()
end)
RaidRoll_RespMining_MainForm.setting.Save.On.Text = RaidRoll_RespMining_MainForm.setting.Save.On:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.Save.On)
RaidRoll_RespMining_MainForm.setting.Save.On.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.Save.On.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.Save.On.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.Save.On.Text:Show();

RaidRoll_RespMining_MainForm.setting.Save.Roll = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_RespMining_MainForm.setting.Save.On, "ChatConfigCheckButtonTemplate");
RaidRoll_RespMining_MainForm.setting.Save.Roll:SetPoint("TOPLEFT", 0, -20);
RaidRoll_RespMining_MainForm.setting.Save.Roll:SetScript("OnClick", function()
    --RaidRollDB.setting.SaveRoll = RaidRoll_RespMining_MainForm.setting.Save.Roll:GetChecked()
    RaidRollDB.setting.SaveRoll = true;
end)
RaidRoll_RespMining_MainForm.setting.Save.Roll.Text = RaidRoll_RespMining_MainForm.setting.Save.Roll:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.Save.Roll)
RaidRoll_RespMining_MainForm.setting.Save.Roll.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.Save.Roll.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_RespMining_MainForm.setting.Save.Roll.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.Save.Roll.Text:Show();


RaidRoll_RespMining_MainForm.setting.Save.CountSave = CreateFrame( "EditBox", nil, RaidRoll_RespMining_MainForm.setting.Save.On , "InputBoxTemplate");
RaidRoll_RespMining_MainForm.setting.Save.CountSave:SetPoint("TOPLEFT", 4, -45);
RaidRoll_RespMining_MainForm.setting.Save.CountSave:SetWidth(40)
RaidRoll_RespMining_MainForm.setting.Save.CountSave:SetHeight(20)
RaidRoll_RespMining_MainForm.setting.Save.CountSave:SetAutoFocus(false)
RaidRoll_RespMining_MainForm.setting.Save.CountSave:SetNumeric(true)
RaidRoll_RespMining_MainForm.setting.Save.CountSave:SetMovable(false)
RaidRoll_RespMining_MainForm.setting.Save.CountSave:SetScript("OnTextChanged",function()
    if not (RaidRoll_RespMining_MainForm.setting.Save.CountSave:GetText() == "") then
        if tonumber(RaidRoll_RespMining_MainForm.setting.Save.CountSave:GetText()) > 0 then
            RaidRollDB.setting.CountSaveRoll = RaidRoll_RespMining_MainForm.setting.Save.CountSave:GetText()
        else
            RaidRollDB.setting.CountSaveRoll = 1;
        end
    end
end);
RaidRoll_RespMining_MainForm.setting.Save.CountSave.Text = RaidRoll_RespMining_MainForm.setting.Save.CountSave:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.Save.CountSave)
RaidRoll_RespMining_MainForm.setting.Save.CountSave.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.Save.CountSave.Text:SetPoint("TOPLEFT", 55, -5)
RaidRoll_RespMining_MainForm.setting.Save.CountSave.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.Save.CountSave.Text:Show();

RaidRoll_RespMining_MainForm.setting.Save.CountViews = CreateFrame( "EditBox", nil, RaidRoll_RespMining_MainForm.setting.Save.On , "InputBoxTemplate");
RaidRoll_RespMining_MainForm.setting.Save.CountViews:SetPoint("TOPLEFT", 4, -65);
RaidRoll_RespMining_MainForm.setting.Save.CountViews:SetWidth(40)
RaidRoll_RespMining_MainForm.setting.Save.CountViews:SetHeight(20)
RaidRoll_RespMining_MainForm.setting.Save.CountViews:SetAutoFocus(false)
RaidRoll_RespMining_MainForm.setting.Save.CountViews:SetNumeric(true)
RaidRoll_RespMining_MainForm.setting.Save.CountViews:SetMovable(false)
RaidRoll_RespMining_MainForm.setting.Save.CountViews:SetScript("OnTextChanged",function()
    if not (RaidRoll_RespMining_MainForm.setting.Save.CountViews:GetText() == "") then
        if tonumber(RaidRoll_RespMining_MainForm.setting.Save.CountViews:GetText()) > 0 then
            RaidRollDB.setting.CountViewsRoll = RaidRoll_RespMining_MainForm.setting.Save.CountViews:GetText();
        else
            RaidRollDB.setting.CountViewsRoll = 1;
        end
    end
end);
RaidRoll_RespMining_MainForm.setting.Save.CountViews.Text = RaidRoll_RespMining_MainForm.setting.Save.CountViews:CreateFontString(nil, "OVERLAY", RaidRoll_RespMining_MainForm.setting.Save.CountViews)
RaidRoll_RespMining_MainForm.setting.Save.CountViews.Text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_RespMining_MainForm.setting.Save.CountViews.Text:SetPoint("TOPLEFT", 55, -5)
RaidRoll_RespMining_MainForm.setting.Save.CountViews.Text:SetJustifyH("LEFT")
RaidRoll_RespMining_MainForm.setting.Save.CountViews.Text:Show();

RaidRoll_RespMining_MainForm.setting.Save.ButtonClearBD = CreateFrame("Button", nil, RaidRoll_RespMining_MainForm.setting.Save.On, "GameMenuButtonTemplate");
RaidRoll_RespMining_MainForm.setting.Save.ButtonClearBD:SetPoint("TOPRIGHT", 260, -95);
RaidRoll_RespMining_MainForm.setting.Save.ButtonClearBD:SetWidth(150)
RaidRoll_RespMining_MainForm.setting.Save.ButtonClearBD:SetHeight(25)
RaidRoll_RespMining_MainForm.setting.Save.ButtonClearBD:SetScript("OnMouseDown", function(self)
    StaticPopup_Show ("EXAMPLE_DELL_ALLITEM");
    StaticPopupDialogs["EXAMPLE_DELL_ALLITEM"] = {
        text = Setting.Localization.PopupDellAllItem,
        button1 = Setting.Localization.PopupYes,
        button2 = Setting.Localization.PopupNo,
        OnAccept = function()
            Clear_AllRollList();
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }
end)
RaidRoll_RespMining_MainForm.setting.Save.ButtonOpenAllSetting = CreateFrame("Button", nil, RaidRoll_RespMining_MainForm.setting.Save.On, "GameMenuButtonTemplate");
RaidRoll_RespMining_MainForm.setting.Save.ButtonOpenAllSetting:SetPoint("TOPRIGHT", 260, -145);
RaidRoll_RespMining_MainForm.setting.Save.ButtonOpenAllSetting:SetWidth(90)
RaidRoll_RespMining_MainForm.setting.Save.ButtonOpenAllSetting:SetHeight(25)
RaidRoll_RespMining_MainForm.setting.Save.ButtonOpenAllSetting:SetScript("OnMouseDown", function(self)
    RaidRoll_MainSetting_mainWindow:Show();
end)
function Open_RaidRoll_RespMining_ScrollFrame(id)
    RaidRoll_RespMining_ScrollFrame:Show();
    Clear_RollListFrame(id);
    RaidRoll_RespMining_RollItemInfo:Hide();
end
function Open_RaidRoll_RespMining_RollItemInfo(id)
    RaidRoll_RespMining_ScrollFrame:Hide();
    Clear_RollListFrame(id);
    Print_RollItemInfo(id);
    RaidRoll_RespMining_RollItemInfo:Show();
end

