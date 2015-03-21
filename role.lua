
local aadon, ns = ...
local cfg = ns.cfg

local role = cfg.role
pos = role.main

local _, class = UnitClass("player")
local class_colo = RAID_CLASS_COLORS[class]

local main = CreateFrame("Frame", role.main.name, UIParent)
main:SetPoint(pos.a1, pos.af, pos.a2, pos.x, pos.y)
main:SetWidth(pos.width)
main:SetHeight(pos.height)
main:EnableMouse(true)

function cf(cfg_frame, role, pos, f_type, ...)
    local frame = nil
    local templet = ...
    if templet == nil then
        templet = role.main.frame
    end
    frame = CreateFrame(f_type, cfg_frame.name, templet)
    frame:SetPoint(pos.a1, pos.af, pos.a2, pos.x, pos.y)
    frame:SetWidth(pos.width)
    frame:SetHeight(pos.height)
    return frame
end

function create_frame(cfg_frame)
    local s, frame = nil, nil
    local pos = cfg_frame
    
    if cfg_frame.f_type == "bar" then
        local tm = pos.texture_m

        frame = cf(cfg_frame, role, pos, "StatusBar")
        frame:SetStatusBarTexture(tm.t)
        frame:SetStatusBarColor(tm.r, tm.g, tm.b, tm.a)
        frame:SetMinMaxValues(1, 100)
        frame:SetValue(100)

        s = frame:CreateTexture(cfg_frame.name .. "textrue")
        s:SetAllPoints(cfg_frame.name)
        s:Show()
    elseif cfg_frame.f_type == "text" then
        --debug(cfg_frame.name)
        frame = cf(cfg_frame, role, pos, "Frame")
        --frame = CreateFrame("Frame", cfg_frame.name, role.main.frame)
        s = frame:CreateFontString(cfg_frame.name .. "text", "OVERLAY")
        s:SetAllPoints(cfg_frame.name)
        s:SetJustifyH(cfg_frame.h)
        s:SetFont(cfg_frame.font, cfg_frame.text_height, "OUTLINE")
        if cfg_frame.string ~= nil then
            s:SetText(cfg_frame.string)
        end
    elseif cfg_frame.f_type == "icon" then
        frame = cf(cfg_frame, role, pos, "Frame")
        --frame = CreateFrame("Frame", cfg_frame.name, role.main.frame)
        local tm = pos.texture_m
        s = frame:CreateTexture(cfg_frame.name .. "icon")
        s:SetAllPoints(cfg_frame.name)
        s:Show()
        if type(tm) == "table" then
            s:SetTexture(tm.r, tm.g, tm.b, tm.a)
        else
            s:SetTexture(tm)
        end
    else
        return frame, s
    end
    if cfg_frame.show then
        frame:Show()
    else
        frame:Hide()
    end
    return frame, s
end

function cc(cfg_frame)
    local f, s = create_frame(cfg_frame)
    cfg_frame.frame = f
    if cfg_frame.text == 0 then
        cfg_frame.text = s
    elseif cfg_frame.texture == 0 then
        cfg_frame.texture = s
    end
    return cfg_frame
end

role.health_bar = cc(role.health_bar)

role.health_text = cc(role.health_text)
role.power_bar = cc(role.power_bar)
role.power_text = cc(role.power_text)
role.health_per = cc(role.health_per)
role.leadericon = cc(role.leadericon)
role.pvpicon = cc(role.pvpicon)
role.resticon = cc(role.resticon)
role.roleicon = cc(role.roleicon)
role.guideicon = cc(role.guideicon)
role.battleicon = cc(role.battleicon)


cfg.role.main.frame = main

-- 这里创建一个beauty边框
local health_bar_background = CreateFrame("Frame")
local hbbt = health_bar_background:CreateTexture("health_bar_background" .. "texture")
health_bar_background:SetWidth(cfg.role.health_bar.width + 1)
health_bar_background:SetHeight(cfg.role.health_bar.height + 1)
health_bar_background:SetPoint("CENTER", role.health_bar.frame, "CENTER", 0, 0)
health_bar_background:Show()
hbbt:SetAllPoints(role.health_bar.name)
hbbt:SetTexture(class_colo.r, class_colo.g, class_colo.b, 0.3)

CreateBorder(health_bar_background, 3, class_colo.r, class_colo.g, class_colo.b, 1)

-- 判断是LM还是BL
-- factionGroup - Non-localized (English) faction name of the faction ('Horde', 'Alliance', or 'Neutral') (string) 
local factionGroup, _ = UnitFactionGroup(PlayerFrame.unit)
local factionRGB = nil
debug(factionGroup)
if factionGroup == "Horde" then
    factionRGB = {r = 255, g = 0, b = 0, a = 1}
elseif factionGroup == "Alliance" then
    factionRGB = {r = 0, g = 0, b = 255, a = 1}
else
    factionRGB = {r = 0, g = 255, b = 0, a = 1}
end

role.pvpicon.text:SetTextColor(factionRGB.r, factionRGB.g, factionRGB.b, factionRGB.a)

function update_icons()
    if UnitIsPVP(PlayerFrame.unit) then
        role.pvpicon.text:SetText("P")
        if role.pvpicon.frame:IsShown() == false then
            role.pvpicon.frame:Show()
        end
    else
        role.pvpicon.frame:Hide()
    end
    if IsResting() then
        role.resticon.text:SetText("R")
        role.resticon.frame:Show()
    else
        role.resticon.frame:Hide()
    end
    local leader = UnitIsGroupLeader(PlayerFrame.unit)
    if leader then
        role.guideicon.text:SetText("L")
        if role.guideicon.frame:IsShown() == false then
            role.guideicon.frame:Show()
        end
    else
        role.guideicon.frame:Hide()
    end

    local rolea = UnitGroupRolesAssigned(PlayerFrame.unit)
    if rolea ~= "NONE" then
        if rolea == "DAMAGER" then
            role.roleicon.text:SetText("D")
        elseif rolea == "HEALER" then
            role.roleicon.text:SetText("H")
        else
            role.roleicon.text:SetText("T")
        end
        if role.roleicon.frame:IsShown() ~= true then
            role.roleicon.frame:Show()
        end
    else
        role.roleicon.frame:Hide()
    end

end

PlayerFrame:UnregisterAllEvents()
PlayerFrame:Hide()




