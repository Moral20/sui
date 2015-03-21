
local aadon, ns = ...
local cfg = {}
ns.cfg = cfg

local icon_x = -40

local TL, T, C, R, RL, L, TR = "TOPLEFT", "TOP", "CENTER", "RIGHT", "RIGHTLEFT", "LEFT", "TOPRIGHT"

local icon_pos, icon_offset, icon_w, icon_h, icon_a1, icon_a2 = -10, 15, 15, 15, "TOP", "LEFT"

local font = PlayerFrameHealthBarText:GetFont()

-- 默认bar和text配置
-----------------------------------------------------------------------
cfg.sui_default_text_type = {
    h = "RIGHT",
    font = font,
    text_height = 8,
    bord = "OUTLINE",
}

cfg.sui_default_text_pos = {
    a1 = "RIGHT", 
    a2 = "RIGHT", 
    af = "health_bar",
    x = 0, 
    y = 20, 
    width = 100,
    height = 10,
}

cfg.sui_default_bar_type = {
    texture = "Interface\TargetingFrame\UI-StatusBar",
    r = 0,
    g = 255,
    b = 0,
    a = 1,
    min = 1,
    max = 100,
}

cfg.sui_default_bar_pos = {
    a1 = "RIGHT", 
    a2 = "RIGHT", 
    af = "health_bar",
    x = 0, 
    y = 20, 
    width = 100,
    height = 10,
}
-- 默认bar和text配置
-----------------------------------------------------------------------

cfg.role = {
    main = {
        frame = nil,
        f_type = "main",
        name = "sui_role_main",
        show = true,
        a1 = C,
        a2 = C,
        af = "UIParent",
        x = -300,
        y = 200,
        width = 200,
        height = 50,
    },

    health_bar = {
        frame = nil, 
        texture = 0,
        f_type = "bar",
        name = "health_bar",
        show = true, 
        a1 = C, 
        a2 = C, 
        af = "sui_role_main", 
        x = 0, 
        y = 0,
        width = 150,
        height = 2,
        texture_m = {t="Interface\TargetingFrame\UI-StatusBar",
        r=0, g=255, b=0, a=1},
    },

     power_bar = {
        frame = nil, 
        texture = 0,
        f_type = "bar",
        name = "power_bar",
        show = false, 
        a1 = C, 
        a2 = C, 
        af = "sui_role_main", 
        x = 0, 
        y = -5,
        width = 100,
        height = 2,
        texture_m = {t="Interface\PlayerFrame\UI-StatusBar",
        r=0, g=0, b=255, a=1},
    },

    health_text = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "health_text",
        show = true, 
        a1 = TR, 
        a2 = TR, 
        af = "health_bar",
        x = 0, 
        y = 20, 
        h = R,
        width = 100,
        height = 10,
        font = font,
        text_height = 8,
    },

    power_text = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "power_text",
        show = true, 
        a1 = TR, 
        a2 = TR, 
        af = "health_bar",
        x = 0, 
        y = -10, 
        h = R,
        width = 100,
        height = 10,
        font = font,
        text_height = 8,
    },

    health_per = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "health_per",
        show = true, 
        a1 = R, 
        a2 = R, 
        af = "health_bar",
        x = 100, 
        y = 0, 
        h = L,
        width = 80,
        height = 10,
        --font = ZoneTextString:GetFont(),
        font = font,
        text_height = 20,
    },

    leadericon = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "leadericon",
        show = false, 
        a1 = icon_a1, 
        a2 = icon_a2, 
        af = "health_bar",
        x = icon_pos, 
        y = 0, 
        h = R,
        width = icon_w,
        height = icon_h,
        texture_m = {r=0, g=255, b=0, a=1},
        font = font,
        string = "P",
        text_height = 8,
    },
    pvpicon = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "pvpicon",
        show = false, 
        a1 = icon_a1, 
        a2 = icon_a2, 
        af = "health_bar",
        x = icon_pos+icon_offset*1, 
        y = 0, 
        h = R,
        width = icon_w,
        height = icon_h,
        texture_m = {r=0, g=255, b=0, a=1},
        font = font,
        string = "P",
        text_height = 8,
    },
    resticon = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "resticon",
        show = false, 
        a1 = icon_a1, 
        a2 = icon_a2, 
        af = "health_bar",
        x = icon_pos+icon_offset*2, 
        y = 0, 
        h = R,
        width = icon_w,
        height = icon_h,
        texture_m = {r=0, g=255, b=0, a=1},
        font = font,
        string = "R",
        text_height = 8,
    },
    roleicon = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "roleicon",
        show = false, 
        a1 = icon_a1, 
        a2 = icon_a2,
        af = "health_bar",
        x = icon_pos+icon_offset*3, 
        y = 0, 
        h = R,
        width = icon_w,
        height = icon_h,
        texture_m = {r=0, g=255, b=0, a=1},
        font = font,
        string = "H",
        text_height = 8,
    },
    guideicon = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "guideicon",
        show = false, 
        a1 = icon_a1, 
        a2 = icon_a2, 
        af = "health_bar",
        x = icon_pos+icon_offset*4, 
        y = 0, 
        h = R,
        width = icon_w,
        height = icon_h,
        texture_m = {r=0, g=255, b=0, a=1},
        font = font,
        string = "L",
        text_height = 8,
    },
    battleicon = {
        frame = nil, 
        text = 0,
        f_type = "text",
        name = "battleicon",
        show = false, 
        a1 = icon_a1, 
        a2 = icon_a2, 
        af = "health_bar",
        x = icon_pos+icon_offset*5, 
        y = 0, 
        h = R,
        width = icon_w,
        height = icon_h,
        texture_m = {r=0, g=255, b=0, a=1},
        font = font,
        string = "L",
        text_height = 8,
    },
}
