RaidRoll_MainSetting_mainWindow = CreateFrame("Frame", "RaidRoll_MainSetting", UIParent, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_MainSetting_mainWindow:ClearAllPoints()
RaidRoll_MainSetting_mainWindow:SetSize(750, 550)
RaidRoll_MainSetting_mainWindow:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                             edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                                             tile = false, tileSize = 10, edgeSize = 10,
                                             insets = { left = 2, right = 2, top = 2, bottom = 2 }});
RaidRoll_MainSetting_mainWindow:SetBackdropColor(0,0,0,0.8);
RaidRoll_MainSetting_mainWindow:SetPoint("CENTER", UIParent, "CENTER")
RaidRoll_MainSetting_mainWindow:SetMovable(true)
RaidRoll_MainSetting_mainWindow:EnableMouse(true)
RaidRoll_MainSetting_mainWindow:SetUserPlaced(true)
RaidRoll_MainSetting_mainWindow:SetScript("OnMouseDown", RaidRoll_MainSetting_mainWindow.StartMoving)
RaidRoll_MainSetting_mainWindow:SetScript("OnMouseUp", RaidRoll_MainSetting_mainWindow.StopMovingOrSizing)
RaidRoll_MainSetting_mainWindow:Hide();
--- выход
RaidRoll_MainSetting_mainWindow.exit = CreateFrame("Frame", "RaidRoll_MainSetting", RaidRoll_MainSetting_mainWindow, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_MainSetting_mainWindow.exit:ClearAllPoints()
RaidRoll_MainSetting_mainWindow.exit:SetSize(15, 15)
RaidRoll_MainSetting_mainWindow.exit:SetPoint("TOPRIGHT", -10, -7)
RaidRoll_MainSetting_mainWindow.exit:SetScript("OnMouseDown", function()
    RaidRoll_MainSetting_mainWindow:Hide();
end)
RaidRoll_MainSetting_mainWindow.exit.text = RaidRoll_MainSetting_mainWindow.exit:CreateFontString(nil, "OVERLAY", RaidRoll_MainSetting_mainWindow.exit)
RaidRoll_MainSetting_mainWindow.exit.text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 16)
RaidRoll_MainSetting_mainWindow.exit.text:SetPoint("LEFT", 2, 1)
RaidRoll_MainSetting_mainWindow.exit.text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.exit.text:SetText('x');
RaidRoll_MainSetting_mainWindow.exit.text:Show();
--- Navigation start
RaidRoll_MainSetting_mainWindow.Navigation = CreateFrame("Frame", "RaidRoll_MainSetting", RaidRoll_MainSetting_mainWindow, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_MainSetting_mainWindow.Navigation:ClearAllPoints()
RaidRoll_MainSetting_mainWindow.Navigation:SetSize(150, 550)
RaidRoll_MainSetting_mainWindow.Navigation:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                                        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                                                        tile = false, tileSize = 10, edgeSize = 10,
                                                        insets = { left = 2, right = 2, top = 2, bottom = 2 }});
RaidRoll_MainSetting_mainWindow.Navigation:SetBackdropColor(0,0,0,0.8);
RaidRoll_MainSetting_mainWindow.Navigation:SetPoint("LEFT", RaidRoll_MainSetting_mainWindow, "LEFT")

--- 1
RaidRoll_MainSetting_mainWindow.Navigation[1] = {};
RaidRoll_MainSetting_mainWindow.Navigation[1].panel = CreateFrame("Frame", "RaidRoll_MainSetting", RaidRoll_MainSetting_mainWindow.Navigation, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_MainSetting_mainWindow.Navigation[1].panel:SetSize(140, 20)
RaidRoll_MainSetting_mainWindow.Navigation[1].panel:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"});
RaidRoll_MainSetting_mainWindow.Navigation[1].panel:SetBackdropColor(0,0,0,0.8);
RaidRoll_MainSetting_mainWindow.Navigation[1].panel:SetPoint("TOPLEFT", 5, -5)
RaidRoll_MainSetting_mainWindow.Navigation[1].panel:SetScript("OnEnter", function(self)
    RaidRoll_MainSetting_mainWindow.Navigation[1].panel:SetBackdropColor(1,1,1,0.8);
end)
RaidRoll_MainSetting_mainWindow.Navigation[1].panel:SetScript("OnLeave", function(self)
    RaidRoll_MainSetting_mainWindow.Navigation[1].panel:SetBackdropColor(0,0,0,0.8);
end)
RaidRoll_MainSetting_mainWindow.Navigation[1].panel.text = RaidRoll_MainSetting_mainWindow.Navigation[1].panel:CreateFontString(nil, "OVERLAY", RaidRoll_MainSetting_mainWindow.Navigation[1].panel)
RaidRoll_MainSetting_mainWindow.Navigation[1].panel.text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_MainSetting_mainWindow.Navigation[1].panel.text:SetPoint("LEFT", 2, 1)
RaidRoll_MainSetting_mainWindow.Navigation[1].panel.text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.Navigation[1].panel.text:Show();
RaidRoll_MainSetting_mainWindow.Navigation[1].panel.text:SetText('Raid Roll Raiders of Rohan');

--- 2
RaidRoll_MainSetting_mainWindow.Navigation[2] = {};
RaidRoll_MainSetting_mainWindow.Navigation[2].panel = CreateFrame("Frame", "RaidRoll_MainSetting", RaidRoll_MainSetting_mainWindow.Navigation, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_MainSetting_mainWindow.Navigation[2].panel:SetSize(140, 20)
RaidRoll_MainSetting_mainWindow.Navigation[2].panel:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"});
RaidRoll_MainSetting_mainWindow.Navigation[2].panel:SetBackdropColor(0,0,0,0.8);
RaidRoll_MainSetting_mainWindow.Navigation[2].panel:SetPoint("TOPLEFT", 5, -25)
RaidRoll_MainSetting_mainWindow.Navigation[2].panel:SetScript("OnEnter", function(self)
    RaidRoll_MainSetting_mainWindow.Navigation[2].panel:SetBackdropColor(1,1,1,0.8);
end)
RaidRoll_MainSetting_mainWindow.Navigation[2].panel:SetScript("OnLeave", function(self)
    RaidRoll_MainSetting_mainWindow.Navigation[2].panel:SetBackdropColor(0,0,0,0.8);
end)
RaidRoll_MainSetting_mainWindow.Navigation[2].panel.text = RaidRoll_MainSetting_mainWindow.Navigation[2].panel:CreateFontString(nil, "OVERLAY", RaidRoll_MainSetting_mainWindow.Navigation[1].panel)
RaidRoll_MainSetting_mainWindow.Navigation[2].panel.text:SetFont("Interface\\AddOns\\RaidRoll\\MORPHEUS.ttf", 12)
RaidRoll_MainSetting_mainWindow.Navigation[2].panel.text:SetPoint("LEFT", 2, 1)
RaidRoll_MainSetting_mainWindow.Navigation[2].panel.text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.Navigation[2].panel.text:Show();
RaidRoll_MainSetting_mainWindow.Navigation[2].panel.text:SetText('Settings');
--- !Navigation end