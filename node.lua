
local aadon, ns = ...

local cfg = ns.cfg
local node

node = CreateFrame("Frame", node.name, "UIParent")
node:SetPoints(node.a1, node.af, node.a2, x, y)

cfg.node = node
