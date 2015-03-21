
local addon, ns = ...

function debug(string)
    DEFAULT_CHAT_FRAME:AddMessage(string,255,255,255)
end


SLASH_RL1 = "/rl"
SlashCmdList["RL"] = function(msg, editBox)
    ReloadUI()
end
