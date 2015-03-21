
local aadon, ns = ...
local cfg = ns.cfg

local role = cfg.role


local  handle_icon_frame = CreateFrame("Frame")


function handle_icon_fun(self, event, ...)
    if event == "PLAYER_REGEN_DISABLED" then
        role.battleicon.text:SetText("B")
        role.battleicon.text:SetTextColor(255, 0, 0, 1)
        if role.battleicon.frame:IsShown() == false then
            role.battleicon.frame:Show()
        end
    end
    if event == "PLAYER_REGEN_ENABLED" then
        role.battleicon.frame:Hide()
    end

end

--handle_icon_frame:RegisterEvent("PLAYER_ENTERING_WORLD")
handle_icon_frame:RegisterEvent("PLAYER_REGEN_DISABLED")
handle_icon_frame:RegisterEvent("PLAYER_REGEN_ENABLED")
--handle_icon_frame:RegisterEvent("PLAYER_UPDATE_RESTING")
--handle_icon_frame:RegisterEvent("PARTY_LEADER_CHANGED")
handle_icon_frame:SetScript("OnEvent", handle_icon_fun)
--handle_icon_frame:SetScript("OnUpdate", handle_icon_fun)


