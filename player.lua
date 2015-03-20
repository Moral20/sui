
local aadon, ns = ...

local cfg = ns.cfg

local sui_cfg_obj = cfg.player

local sui_player = CreateFrame("Frame", sui_cfg_obj.frame_name, PlayerFrame)

function sui_player_hide(frame)
end

function sui_move_health()
end

function sui_move_power()
end

function sui_update_text(config)
end

function sui_player_update(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        -- 玩家进入游戏,这里要隐藏一些东西
        -- 调整好玩家头像位置
        sui_player_hide(sui_cfg_obj.frame)
        sui_move_health()
        sui_move_power()
        sui_update_text()
        return
    end

    sui_update_text(sui_cfg_obj)

end


sui_player:RegisterEvent("PLAYER_ENTERING_WORLD")
--sui_player:RegisterEvent("")
sui_player:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "player")
sui_player:SetScript("OnEvent", sui_player_update)
sui_player:SetScript("OnUpdate", sui_player_update)


