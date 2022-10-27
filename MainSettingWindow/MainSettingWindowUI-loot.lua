RaidRoll_MainSetting_mainWindow.SettingLoot = CreateFrame("Frame", "RaidRoll_MainSetting", RaidRoll_MainSetting_mainWindow, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_MainSetting_mainWindow.SettingLoot:ClearAllPoints()
RaidRoll_MainSetting_mainWindow.SettingLoot:SetSize(600, 400)
RaidRoll_MainSetting_mainWindow.SettingLoot:SetPoint("TOPRIGHT", RaidRoll_MainSetting_mainWindow, "TOPRIGHT")
RaidRoll_MainSetting_mainWindow.SettingLoot:SetPoint("TOPRIGHT", 0, -25);
RaidRoll_MainSetting_mainWindow.SettingLoot.title = RaidRoll_MainSetting_mainWindow.Setting:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.SettingLoot.title:SetFont("Fonts\\arialn.ttf", 15)
RaidRoll_MainSetting_mainWindow.SettingLoot.title:SetPoint("TOPLEFT", 10, -15)
RaidRoll_MainSetting_mainWindow.SettingLoot.title:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.SettingLoot.title:Show();

RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_MainSetting_mainWindow.SettingLoot, "ChatConfigCheckButtonTemplate");
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot:SetPoint("TOPLEFT", 10, -35);
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot.Text = RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot.Text:Show();
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot:SetScript("OnClick", function()
    RaidRollDB.setting.AutoOpenLoot = RaidRoll_MainSetting_mainWindow.SettingLoot.AutoOpenLoot:GetChecked()
end)

RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_MainSetting_mainWindow.SettingLoot, "ChatConfigCheckButtonTemplate");
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup:SetPoint("TOPLEFT", 10, -65);
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text = RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text:Show();
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup:SetScript("OnClick", function()
    RaidRollDB.setting.OpenLootOnlyRaidOrGroup = RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup:GetChecked()
end)

RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_MainSetting_mainWindow.SettingLoot, "ChatConfigCheckButtonTemplate");
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup:SetPoint("TOPLEFT", 10, -65);
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text = RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup.Text:Show();
RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup:SetScript("OnClick", function()
    RaidRollDB.setting.OpenLootOnlyRaidOrGroup = RaidRoll_MainSetting_mainWindow.SettingLoot.OpenLootOnlyRaidOrGroup:GetChecked()
end)

RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_MainSetting_mainWindow.SettingLoot, "ChatConfigCheckButtonTemplate");
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList:SetPoint("TOPLEFT", 10, -95);
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList.Text = RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList.Text:Show();
RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList:SetScript("OnClick", function()
    RaidRollDB.setting.AutoAddItemRollList = RaidRoll_MainSetting_mainWindow.SettingLoot.AutoAddItemRollList:GetChecked()
end)

RaidRoll_MainSetting_mainWindow.SettingLoot:Hide();
