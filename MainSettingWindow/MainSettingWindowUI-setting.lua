RaidRoll_MainSetting_mainWindow.Setting = CreateFrame("Frame", "RaidRoll_MainSetting", RaidRoll_MainSetting_mainWindow, BackdropTemplateMixin and "BackdropTemplate")
RaidRoll_MainSetting_mainWindow.Setting:ClearAllPoints()
RaidRoll_MainSetting_mainWindow.Setting:SetSize(600, 400)
RaidRoll_MainSetting_mainWindow.Setting:SetPoint("TOPRIGHT", RaidRoll_MainSetting_mainWindow, "TOPRIGHT")
RaidRoll_MainSetting_mainWindow.Setting:SetPoint("TOPRIGHT", 0, -25);
RaidRoll_MainSetting_mainWindow.Setting.title = RaidRoll_MainSetting_mainWindow.Setting:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.Setting.title:SetFont("Fonts\\arialn.ttf", 15)
RaidRoll_MainSetting_mainWindow.Setting.title:SetPoint("TOPLEFT", 10, -15)
RaidRoll_MainSetting_mainWindow.Setting.title:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.Setting.title:Show();

RaidRoll_MainSetting_mainWindow.Setting.timerOn = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_MainSetting_mainWindow.Setting, "ChatConfigCheckButtonTemplate");
RaidRoll_MainSetting_mainWindow.Setting.timerOn:SetPoint("TOPLEFT", 10, -35);
RaidRoll_MainSetting_mainWindow.Setting.timerOn.Text = RaidRoll_MainSetting_mainWindow.Setting.timerOn:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.Setting.timerOn.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.Setting.timerOn.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_MainSetting_mainWindow.Setting.timerOn.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.Setting.timerOn.Text:Show();
RaidRoll_MainSetting_mainWindow.Setting.timerOn:SetScript("OnClick", function()
    RaidRollDB.setting.TimerOn = RaidRoll_MainSetting_mainWindow.Setting.timerOn:GetChecked()
end)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec = CreateFrame( "EditBox", nil, RaidRoll_MainSetting_mainWindow.Setting , "InputBoxTemplate");
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:SetPoint("TOPLEFT", 35, -85);
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:SetWidth(40)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:SetHeight(20)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:SetAutoFocus(false)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:SetNumeric(true)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:SetMovable(false)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec.Text = RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec.Text:SetPoint("TOPLEFT", -25, 15)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec.Text:Show();
RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:SetScript("OnTextChanged",function()
    if not (RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:GetText() == "") then
        if tonumber(RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:GetText()) > 0 then
            RaidRollDB.setting.TimerCountSec = RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:GetText()
        else
            RaidRollDB.setting.TimerCountSec = 60;
        end
    end
end);
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons = CreateFrame( "EditBox", nil, RaidRoll_MainSetting_mainWindow.Setting , "InputBoxTemplate");
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetPoint("TOPLEFT", 335, -85);
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetWidth(40)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetHeight(20)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetAutoFocus(false)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetNumeric(true)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetMovable(false)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons.Text = RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons.Text:SetPoint("TOPLEFT", -25, 15)
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons.Text:Show();
RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetScript("OnTextChanged",function()
    if not (RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:GetText() == "") then
        if tonumber(RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:GetText()) > 29 then
            RaidRollDB.setting.TimerCountSecAnons = RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:GetText()
        else
            RaidRollDB.setting.TimerCountSecAnons = 10;
            RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetText(10);
        end
    end
end);
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_MainSetting_mainWindow.Setting, "ChatConfigCheckButtonTemplate");
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart:SetPoint("TOPLEFT", 10, -115);
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart.Text = RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart.Text:Show();
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart:SetScript("OnClick", function()
    RaidRollDB.setting.TimerAutoStartOn = RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart:GetChecked()
end)
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop = CreateFrame("CheckButton", "addItemPersonalChat_GlobalName", RaidRoll_MainSetting_mainWindow.Setting, "ChatConfigCheckButtonTemplate");
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop:SetPoint("TOPLEFT", 10, -145);
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop.Text = RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop:CreateFontString(nil, "OVERLAY", "GameTooltipText")
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop.Text:SetFont("Fonts\\arialn.ttf", 12)
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop.Text:SetPoint("TOPLEFT", 25, -5)
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop.Text:SetJustifyH("LEFT")
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop.Text:Show();
RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop:SetScript("OnClick", function()
    RaidRollDB.setting.TimerAutoStopOn = RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop:GetChecked()
end)
RaidRoll_MainSetting_mainWindow.Setting:Hide();