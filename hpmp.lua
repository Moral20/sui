
local aadon, ns = ...
local cfg = ns.cfg

local role = cfg.role

local _, class = UnitClass("player")
local class_colo = RAID_CLASS_COLORS[class]
local red = {r=255, g=0, b=0}
local green = {r=0, g=255, b=0}


local frame = CreateFrame("Frame")

function hpmp_update(self, event, ...)
    local hp, maxhp, power, maxpower, hpp, mpp = 0
    local unit = PlayerFrame.unit

    hp = UnitHealth(unit)
    maxhp = UnitHealthMax(unit)
    power = UnitPower(unit)
    maxpower = UnitPowerMax(unit)

    hpp = hp/maxhp*100
    mpp = power/maxpower*100

    role.health_text.text:SetText(hp)
    role.health_text.text:SetTextColor(green.r, green.g, green.b, 1)
    role.health_per.text:SetFormattedText("%d%%", hpp)
    if hpp < 30 then
        role.health_per.text:SetTextColor(red.r, red.g, red.b, 1)
    else
        role.health_per.text:SetTextColor(green.r, green.g, green.b, 1)
    end

    role.power_text.text:SetFormattedText(power .. " | " .. "%d%%" , mpp)
    role.power_text.text:SetTextColor(class_colo.r, class_colo.g, class_colo.b, 1)

    role.health_bar.frame:SetValue(hpp)
    if role.power_bar ~= nil then
        role.power_bar.frame:SetValue(mpp)
    end
    update_icons()
end

frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "player")
frame:SetScript("OnEvent", hpmp_update)
frame:SetScript("OnUpdate", hpmp_update)
