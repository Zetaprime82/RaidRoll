LootWindow = CreateFrame("ScrollFrame", "sUser_Frame", UIParent, "BasicFrameTemplate")
LootWindow:ClearAllPoints()
LootWindow:SetSize(250, 300)
LootWindow:SetPoint("CENTER", UIParent, "CENTER")
LootWindow:SetMovable(true)
LootWindow:EnableMouse(true)
LootWindow:SetUserPlaced(true)
LootWindow:SetScript("OnMouseDown", LootWindow.StartMoving)
LootWindow:SetScript("OnMouseUp", LootWindow.StopMovingOrSizing)
LootWindow.icon = {}
LootWindow.Text = {}
LootWindow.ui = {}
local LootWindow_ScrollRollItemFrame = CreateFrame("ScrollFrame", "RaidRoll_RespMining_ScrollFrame", LootWindow, "UIPanelScrollFrameTemplate")
LootWindow_ScrollRollItemFrame:SetWidth(220)
LootWindow_ScrollRollItemFrame:SetHeight(260)
LootWindow_ScrollRollItemFrame:SetPoint("TOPLEFT", 0, -30)


LootWindow.itemListFrame = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", LootWindow, BackdropTemplateMixin and "BackdropTemplate")
LootWindow.itemListFrame:ClearAllPoints()
LootWindow.itemListFrame:SetSize(240, 600)
LootWindow.itemListFrame:SetPoint("CENTER", UIParent, "CENTER")
LootWindow_ScrollRollItemFrame:SetScrollChild(LootWindow.itemListFrame)
LootWindow:Hide();