LootWindow_ItemList = {};
LootWindow_ItemList.item = {};
LootWindow_ItemList.count = 0;
LootWindow_ItemList.RollerList = {};
LootWindow_ItemList.ui = {};
function GetWindow_ItemList(count)
    LootWindow_clear_ItemList();
    local checkNewItem = false
    for i = 1, count, 1 do
        if (GetLootSlotLink(i)) then
            if  Check_Correct_Item(GetLootSlotLink(i))  then
                LootWindow_ItemList.item[LootWindow_ItemList.count+1] = GetLootSlotLink(i);
                LootWindow_ItemList.ui[LootWindow_ItemList.count+1] = {}
                LootWindow_ItemList.count = LootWindow_ItemList.count +1;
                if RaidRollDB.setting.AutoAddItemRollList then
                    Add_RollItemList(GetLootSlotLink(i), UnitName("Player").."-"..GetRealmName())
                end
                checkNewItem = true;
            end
        end
    end
    if checkNewItem then
        if RaidRollDB.setting.AutoAddItemRollList then
            RaidRoll_RespMining_MainForm:Show();
        else
            LootWindow_print_ItemList();
            LootWindow:Show();
        end
    end
end
function LootWindow_print_ItemList()
    local MarginTop = 3;
    for i = 1, LootWindow_ItemList.count, 1 do
        if not LootWindow_ItemList.ui[i].panel then
            LootWindow_ItemList.ui[i].panel = CreateFrame("Frame", "LootWindow_ItemList_ItemForm", LootWindow.itemListFrame, BackdropTemplateMixin and "BackdropTemplate")
            LootWindow_ItemList.ui[i].panel:ClearAllPoints()
            LootWindow_ItemList.ui[i].panel:SetSize(300, 60)
            LootWindow_ItemList.ui[i].panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
            LootWindow_ItemList.ui[i].panel:SetPoint("TOPLEFT", 4, -MarginTop)
            LootWindow_ItemList.ui[i].icon = CreateFrame("Button", nil,  LootWindow_ItemList.ui[i].panel, "GameMenuButtonTemplate")
            LootWindow_ItemList.ui[i].icon:SetPoint("LEFT",  LootWindow_ItemList.ui[i].panel, "LEFT", 3, 0)
            LootWindow_ItemList.ui[i].icon:SetSize(50, 50)
            LootWindow_ItemList.ui[i].icon.overlay =  LootWindow_ItemList.ui[i].icon:CreateTexture(nil, "OVERLAY")
            LootWindow_ItemList.ui[i].icon.overlay:SetPoint("LEFT", LootWindow_ItemList.ui[i].panel, "LEFT", 3, 0)
            LootWindow_ItemList.ui[i].icon.overlay:SetSize(50, 50)
            LootWindow_ItemList.ui[i].icon:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)
            LootWindow_ItemList.ui[i].bgtitle = CreateFrame("Frame", "RaidRoll_RespMining_ItemForm", LootWindow_ItemList.ui[i].panel, BackdropTemplateMixin and "BackdropTemplate")
            LootWindow_ItemList.ui[i].bgtitle:ClearAllPoints()
            LootWindow_ItemList.ui[i].bgtitle:SetSize(300, 20)
            LootWindow_ItemList.ui[i].bgtitle:SetPoint("TOPLEFT", 0, 0)
            LootWindow_ItemList.ui[i].bgtitle:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
            LootWindow_ItemList.ui[i].bgtitle:SetBackdropColor(0, 0, 0, 0.8)
            LootWindow_ItemList.ui[i].title = LootWindow_ItemList.ui[i].bgtitle:CreateFontString(nil, "OVERLAY", LootWindow_ItemList.ui[i].bgtitle)
            LootWindow_ItemList.ui[i].title:SetFont("Fonts\\arialn.ttf", 12)
            LootWindow_ItemList.ui[i].title:SetPoint("TOPLEFT", 55, -2)
            LootWindow_ItemList.ui[i].title:SetJustifyH("LEFT")
            LootWindow_ItemList.ui[i].title:Show();
            LootWindow_ItemList.ui[i].buttonAddRoll = CreateFrame("Button", nil,  LootWindow_ItemList.ui[i].panel, "GameMenuButtonTemplate")
            LootWindow_ItemList.ui[i].buttonAddRoll:SetPoint("LEFT",  LootWindow_ItemList.ui[i].panel, "LEFT", 55, -10)
            LootWindow_ItemList.ui[i].buttonAddRoll:SetSize(60, 30)
        end
        LootWindow_ItemList.ui[i].title:SetText("|cFF040301"..LootWindow_ItemList.item[i]);
        LootWindow_ItemList.ui[i].icon.overlay:SetTexture(GetItemIcon(LootWindow_ItemList.item[i]))
        LootWindow_ItemList.ui[i].icon:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:ClearLines()
            local _, id = GetItemInfo(tostring(LootWindow_ItemList.item[i]))
            GameTooltip:SetHyperlink(id)
            GameTooltip:Show()
        end)
        LootWindow_ItemList.ui[i].buttonAddRoll:SetScript("OnMouseDown", function(self)
            Add_RollItemList(LootWindow_ItemList.item[i], UnitName("Player").."-"..GetRealmName())
        end)
        LootWindow_ItemList.ui[i].panel:Show();
        MarginTop = MarginTop + 64;
    end
end

function LootWindow_clear_ItemList()
    for i = 1, LootWindow_ItemList.count, 1 do
        if  LootWindow_ItemList.ui[i].panel then
            LootWindow_ItemList.ui[i].panel:Hide();
        end
    end
    LootWindow_ItemList.item = {};
    LootWindow_ItemList.count = 0;
    LootWindow_ItemList.ui = {};
end
