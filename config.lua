
local aadon, ns = ...
local cfg = {}
ns.cfg = cfg

local icon_x = -40

cfg.node = {
    name = "node",
    a1 = "CENTER",
    a2 = "CENTER",
    af = "UIParent",
    x = 0,
    y = 0,
}

cfg.player = {
    frame_name = {name = "sui_player"},
    frame = {name = PlayerFrame},
    main_frame = {frame = PlayerFrame, show = true, a1 = "TOPLEFT", a2 = "TOPLEFT", af = "UIParent", x= 530, y = -400},
    health_bar = {frame = PlayerFrameHealthBar, show = true, a1 = "TOP", a2 = "TOP", af = PlayerFrame, x = 0, y = 0,},
    health_text = {frame = PlayerFrameHealthBarText, show = true, a1 = "TOP", a2 = "RIGHT", af = PlayerFrameHealthBar, x = -20, y = 20, h = "RIGHT"},
    power_bar = {frame = PlayerFrameManaBar, show = false,},
    power_text = {frame = PlayerFrameManaBarText, show = true, a1 = "TOP", a2 = "LEFT", af = PlayerFrameHealthBar, x = 38, y = 20, h = "LEFT"},
    health_per = {frame = 0, text = 0, show = true, a1 = "RIGHT", a2 = "RIGHT", af = PlayerFrameHealthBar, x = 120, y = 0, h = "LEFT", w = 20},
--    power_per = {frame = 0, text = 0, show = true, a1 = "LEFT", a2 = "LEFT", af = PlayerFrameHealthBar, x = -120, y = 0, h = "RIGHT", w = 10},
    level_text = {frame = PlayerLevelText,  show = false,},
    leadericon = {frame = PlayerLeaderIcon, show = true,  a1 = "LEFT", a2 = "LEFT", af = PlayerFrameHealthBar, x = icon_x+20, y = 0, },
    pvpicon = {frame = PlayerPVPIcon, show = true,  a1 = "LEFT", a2 = "LEFT", af = PlayerFrameHealthBar, x = icon_x, y = -5, width = 25, height = 25},
    resticon = {frame = PlayerRestIcon, show = true,  a1 = "LEFT", a2 = "LEFT", af = PlayerFrameHealthBar, x = icon_x-30, y = 0, width = 25, height = 25},
    role_icon = {frame = PlayerFrameRoleIcon, show = true,  a1 = "LEFT", a2 = "LEFT", af = PlayerFrameHealthBar, x = icon_x-30, y = 0, },
    guide_icon = {frame = PlayerGuideIcon, show = true,  a1 = "LEFT", a2 = "LEFT", af = PlayerFrameHealthBar, x = icon_x-30, y = 0, },
}
