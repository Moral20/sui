
local aadon, ns = ...
local cfg = ns.cfg

-- 这个文件承担创建组件的功能
-- 暂时支持创建 text, bar
--
function create_text_frame(frame_type, name, templete, text_type, pos, ...)
    local text, frame_table, frame = nil, {}, nil

    if text_type == nil then
        text_type = cfg.sui_default_text_type
    end

    if pos == nil then
        pos = cfg.sui_default_text_pos
    end

     if templet == nil then
        templet = UIParent
    end
    frame = CreateFrame(frame_type, name, templete)
    frame:SetPoint(pos.a1, pos.af, pos.a2, pos.x, pos.y)
    frame:SetWidth(pos.width)
    frame:SetHeight(pos.height)

    text = frame:CreateFontString(name .. "text", "OVERLAY")
    text:SetAllPoints(name)
    text:SetJustifyH(text_type.h)
    text:SetFont(text_type.font, text_type.text_height, text_type.bord)--"OUTLINE")
    text:Show()

    frame_table = {
        frame = frame,
        text = text,
        name = name, 
        frame_type = frame_type,
        text_type = text_type,
        pos = pos,
    }
    return 
end

function create_bar_frame(frame_type, name, templete, bar_type, pos, ...)
    local bar, frame_table, frame, text = nil, {}, nil, nil
    if bar_type == nil then
        bar_type = cfg.sui_default_bar_type
    end

    if pos == nil then
        pos = cfg.sui_default_bar_pos
    end

     if templet == nil then
        templet = UIParent
    end

    frame = CreateFrame(frame_type, name, templete)
    frame:SetPoint(pos.a1, pos.af, pos.a2, pos.x, pos.y)
    frame:SetWidth(pos.width)
    frame:SetHeight(pos.height)
    frame:SetStatusBarTexture(bar_type.texture)
    frame:SetStatusBarColor(bar_type.r, bar_type.g, bar_type.b, bar_type.a)
    frame:SetMinMaxValues(bar_type.min, bar_type.max)

    text = frame:CreateTexture(name .. "textrue")
    text:SetAllPoints(name)
    text:Show()

    frame_table = {
        frame = frame,
        text = text,
        name = name, 
        frame_type = frame_type,
        bar_type = bar_type,
        pos = pos,
    }

    return frame_table
end
