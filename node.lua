
local aadon, ns = ...
local cfg = ns.cfg

local node


node = CreateFrame("Frame", cfg.node.name, UIParent)
node:SetPoint(cfg.node.a1, cfg.node.af, cfg.node.a2, cfg.node.x, cfg.node.y)

