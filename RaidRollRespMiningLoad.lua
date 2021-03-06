
function RaidRoll_RespMining_SetText()
    RaidRoll_RespMining_RollItemInfo.start.Text:SetText("|cFFab885c"..Setting.Localization.Start);
    RaidRoll_RespMining_RollItemInfo.finish.Text:SetText("|cFF040301"..Setting.Localization.End);
    RaidRoll_RespMining_RollItemInfo.roll.Text:SetText("|cFFab885c"..Setting.Localization.RollPrint);
    RaidRoll_RespMining_RollItemInfo.reRoll.Text:SetText("|cFF040301"..Setting.Localization.timer);
    RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Text:SetText("|cFFab885c"..Setting.Localization.PersonalChat);
    RaidRoll_RespMining_MainForm.setting.itemPersonalChat.Title:SetText("|cFFab885c"..Setting.Localization.RollItem);
    RaidRoll_RespMining_MainForm.setting.itemPersonalChat.TitleItemQ:SetText("|cFFab885c"..Setting.Localization.Quality);
    RaidRoll_RespMining_MainForm.setting.itemPersonalChat.tooltip = Setting.Localization.TooltipItemPersonalChat;
    RaidRoll_RespMining_MainForm.setting.itemGetItemPoor.tooltip = Setting.Localization.TooltipItemRare;
    RaidRoll_RespMining_MainForm.setting.itemGetItemPoor.Text:SetText("|cFFab885c"..Setting.Localization.QualityPoor);
    RaidRoll_RespMining_MainForm.setting.itemGetItemCommon.tooltip = Setting.Localization.TooltipItemRare;
    RaidRoll_RespMining_MainForm.setting.itemGetItemCommon.Text:SetText(""..Setting.Localization.QualityCommon);
    RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon.Text:SetText("|cFF1eff00"..Setting.Localization.QualityUncommon);
    RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon.tooltip = Setting.Localization.TooltipItemRare;
    RaidRoll_RespMining_MainForm.setting.itemGetItemRare.tooltip = Setting.Localization.TooltipItemRare;
    RaidRoll_RespMining_MainForm.setting.itemGetItemRare.Text:SetText("|cFF0070dd"..Setting.Localization.QualityRare);
    RaidRoll_RespMining_MainForm.setting.itemGetItemEpic.tooltip = Setting.Localization.TooltipItemRare;
    RaidRoll_RespMining_MainForm.setting.itemGetItemEpic.Text:SetText("|cFF9345ff"..Setting.Localization.QualityEpic);
    RaidRoll_RespMining_MainForm.setting.itemGetItemLegend.tooltip = Setting.Localization.TooltipItemRare;
    RaidRoll_RespMining_MainForm.setting.itemGetItemLegend.Text:SetText("|cFFff8000"..Setting.Localization.QualityLegend);
    RaidRoll_RespMining_MainForm.setting.itemGetILvl.Text:SetText("|cFFab885c"..Setting.Localization.MinIlvl);
    RaidRoll_RespMining_MainForm.setting.Language.Text:SetText("|cFFab885c"..Setting.Localization.LocalzSettingTitle);
    RaidRoll_RespMining_MainForm.setting.Save:SetText("|cFFab885c"..Setting.Localization.Save);
    RaidRoll_RespMining_MainForm.setting.Save.On.Text:SetText("|cFFab885c"..Setting.Localization.SaveOn);
    RaidRoll_RespMining_MainForm.setting.Save.On.tooltip = Setting.Localization.TooltipSaveItem;
    RaidRoll_RespMining_MainForm.setting.Save.Roll.tooltip = Setting.Localization.TooltipSaveRollItem;
    RaidRoll_RespMining_MainForm.setting.Save.Roll.Text:SetText("|cFFab885c"..Setting.Localization.SaveRoll);
    RaidRoll_RespMining_MainForm.setting.Save.CountSave.Text:SetText("|cFFab885c"..Setting.Localization.CountSave);
    RaidRoll_RespMining_MainForm.setting.Save.CountViews.Text:SetText("|cFFab885c"..Setting.Localization.CountViews);
    RaidRoll_RespMining_MainForm.setting.Save.ButtonClearBD:SetText("|cFFab885c"..Setting.Localization.ClearBD);
    RaidRoll_RespMining_MainForm.setting.Save.ButtonOpenAllSetting:SetText("|cFFab885c"..Setting.Localization.openAllSetting);
    UIDropDownMenu_SetText(RaidRoll_RespMining_MainForm.setting.Language, "English")
    if(RaidRollDB.localization)then
        if (RaidRollDB.localization == "en") then
            UIDropDownMenu_SetText(RaidRoll_RespMining_MainForm.setting.Language,"English");
        end
    end
    --- Main Setting Window
    RaidRoll_MainSetting_mainWindow.Setting.title:SetText(Setting.Localization.Setting);
    RaidRoll_MainSetting_mainWindow.Navigation[2].panel.text:SetText(Setting.Localization.Setting);
    RaidRoll_MainSetting_mainWindow.Setting.timerOn.Text:SetText(Setting.Localization.timerOn);
    RaidRoll_MainSetting_mainWindow.Setting.timerCountSec.Text:SetText(Setting.Localization.timerCountSecEnd);
    RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons.Text:SetText(Setting.Localization.timerCountSecAnons);
    RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart.Text:SetText(Setting.Localization.timerAutoStart);
    RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop.Text:SetText(Setting.Localization.timerAutoStop);
    --- End Main Setting Window
end
function Set_BD_Setting_Value()
    if RaidRollDB.setting.GetItemPM then
        RaidRoll_RespMining_MainForm.setting.itemPersonalChat:SetChecked(RaidRollDB.setting.GetItemPM)
    end
    if RaidRollDB.setting.GetItemQualityPoor then
        RaidRoll_RespMining_MainForm.setting.itemGetItemPoor:SetChecked(RaidRollDB.setting.GetItemQualityPoor)
    end
    if RaidRollDB.setting.GetItemQualityCommon then
        RaidRoll_RespMining_MainForm.setting.itemGetItemCommon:SetChecked(RaidRollDB.setting.GetItemQualityCommon)
    end
    if RaidRollDB.setting.GetItemQualityUncommon then
        RaidRoll_RespMining_MainForm.setting.itemGetItemUncommon:SetChecked(RaidRollDB.setting.GetItemQualityUncommon)
    end
    if RaidRollDB.setting.GetItemQualityRare then
        RaidRoll_RespMining_MainForm.setting.itemGetItemRare:SetChecked(RaidRollDB.setting.GetItemQualityRare)
    end
    if RaidRollDB.setting.GetItemQualityEpic then
        RaidRoll_RespMining_MainForm.setting.itemGetItemEpic:SetChecked(RaidRollDB.setting.GetItemQualityEpic)
    end
    if RaidRollDB.setting.GetItemQualityLegend then
        RaidRoll_RespMining_MainForm.setting.itemGetItemLegend:SetChecked(RaidRollDB.setting.GetItemQualityLegend)
    end
    if RaidRollDB.setting.GetItemMinILvl then
        RaidRoll_RespMining_MainForm.setting.itemGetILvl:SetText(RaidRollDB.setting.GetItemMinILvl)
    end
    if RaidRollDB.setting.SaveOn then
        RaidRoll_RespMining_MainForm.setting.Save.On:SetChecked(RaidRollDB.setting.SaveOn)
    end
    if RaidRollDB.setting.SaveRoll then
        RaidRoll_RespMining_MainForm.setting.Save.Roll:SetChecked(RaidRollDB.setting.SaveRoll)
    end
    if RaidRollDB.setting.CountSaveRoll then
        RaidRoll_RespMining_MainForm.setting.Save.CountSave:SetText(RaidRollDB.setting.CountSaveRoll)
    end
    if RaidRollDB.setting.CountViewsRoll then
        RaidRoll_RespMining_MainForm.setting.Save.CountViews:SetText(RaidRollDB.setting.CountViewsRoll)
    end
    --- Main Setting Window
    if RaidRollDB.setting.TimerOn then
        RaidRoll_MainSetting_mainWindow.Setting.timerOn:SetChecked(RaidRollDB.setting.TimerOn)
    end
    if RaidRollDB.setting.TimerAutoStartOn then
        RaidRoll_MainSetting_mainWindow.Setting.timerAutoStart:SetChecked(RaidRollDB.setting.TimerAutoStartOn)
    end
    if RaidRollDB.setting.TimerAutoStopOn then
        RaidRoll_MainSetting_mainWindow.Setting.timerAutoStop:SetChecked(RaidRollDB.setting.TimerAutoStopOn)
    end
    if RaidRollDB.setting.TimerCountSec then
        RaidRoll_MainSetting_mainWindow.Setting.timerCountSec:SetText(RaidRollDB.setting.TimerCountSec)
    end
    if RaidRollDB.setting.TimerCountSecAnons then
        RaidRoll_MainSetting_mainWindow.Setting.timerCountSecAnons:SetText(RaidRollDB.setting.TimerCountSecAnons)
    end
    --- End Main Setting Window
end
function Set_Default_Setting_Value()
    if not RaidRollDB.setting.GetItemPM then
        RaidRollDB.setting.GetItemPM = true;
    end
    if not RaidRollDB.setting.GetItemQualityPoor then
        RaidRollDB.setting.GetItemQualityPoor = false;
    end
    if not RaidRollDB.setting.GetItemQualityCommon then
        RaidRollDB.setting.GetItemQualityCommon = false;
    end
    if not RaidRollDB.setting.GetItemQualityUncommon then
        RaidRollDB.setting.GetItemQualityUncommon = false;
    end
    if not RaidRollDB.setting.GetItemQualityRare then
        RaidRollDB.setting.GetItemQualityRare = true;
    end
    if not RaidRollDB.setting.GetItemQualityEpic then
        RaidRollDB.setting.GetItemQualityEpic = true;
    end
    if not RaidRollDB.setting.GetItemQualityLegend then
        RaidRollDB.setting.GetItemQualityLegend = true;
    end
    if not RaidRollDB.setting.GetItemMinILvl then
        RaidRollDB.setting.GetItemMinILvl = 220;
    end
    if not RaidRollDB.setting.SaveOn then
        RaidRollDB.setting.SaveOn = true;
    end
    if not RaidRollDB.setting.SaveRoll then
        RaidRollDB.setting.SaveRoll = true;
    end
    if not RaidRollDB.setting.CountSaveRoll then
        RaidRollDB.setting.CountSaveRoll = 50;
    end
    if not RaidRollDB.setting.CountViewsRoll then
        RaidRollDB.setting.CountViewsRoll = 30;
    end

    --- Main Setting Window
    if not RaidRollDB.setting.TimerOn then
        RaidRollDB.setting.TimerOn = false;
    end
    if not RaidRollDB.setting.TimerAutoStartOn then
        RaidRollDB.setting.TimerAutoStartOn = false;
    end
    if not RaidRollDB.setting.TimerAutoStopOn then
        RaidRollDB.setting.TimerAutoStopOn = false;
    end
    if not RaidRollDB.setting.TimerCountSec then
        RaidRollDB.setting.TimerCountSec = 60;
    end
    if not  RaidRollDB.setting.TimerCountSecAnons then
        RaidRollDB.setting.TimerCountSecAnons = 20;
    end
    --- End Main Setting Window
    Set_BD_Setting_Value();
end