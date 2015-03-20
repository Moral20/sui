
local aadon, ns = ...

local cfg = ns.cfg


cfg.node = {
    name = "node"
    a1 = "CENTER",
    a2 = "CENTER",
    af = "UIParent",
    x = 0,
    y = 0,
}

cfg.player = {
    frame = PlayerFrame
    frame_name = "sui_player",
    name = {frame = 0, show = true, a1 = "", a2 = "", af = "", x = 0, y = 0,},
    health_bar = {frame = 0, show = true, a1 = "", a2 = "", af = "", x = 0, y = 0,},
    health_text = {frame = 0, show = true, a1 = "", a2 = "", af = "", x = 0, y = 0,},
    power_bar = {frame = 0, show = true, a1 = "", a2 = "", af = "", x = 0, y = 0,},
    power_text = {frame = 0, show = true, a1 = "", a2 = "", af = "", x = 0, y = 0,},
    health_per = {frame = 0, show = true, a1 = "", a2 = "", af = "", x = 0, y = 0,},
    power_per = {frame = 0, show = true, a1 = "", a2 = "", af = "", x = 0, y = 0,},
}
