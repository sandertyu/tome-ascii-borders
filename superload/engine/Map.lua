local _M = loadPrevious(...)

-- superloaded code
local style = config.settings.tome.ascii_border_style

if style == "default" then
        _M.faction_friend = "tactical_friend_default.png"
        _M.faction_neutral = "tactical_neutral_default.png"
        _M.faction_enemy = "tactical_enemy_default.png"
        _M.faction_danger = "tactical_danger_default.png"
        _M.faction_powerful = "tactical_powerful_default.png"
        _M.faction_self = "tactical_self_default.png"
end
if style == "thick" then
        _M.faction_friend = "tactical_friend_thick.png"
        _M.faction_neutral = "tactical_neutral_thick.png"
        _M.faction_enemy = "tactical_enemy_thick.png"
        _M.faction_danger = "tactical_danger_thick.png"
        _M.faction_powerful = "tactical_powerful_thick.png"
        _M.faction_self = "tactical_self_thick.png"
end
if style == "thin" then
        _M.faction_friend = "tactical_friend_thin.png"
        _M.faction_neutral = "tactical_neutral_thin.png"
        _M.faction_enemy = "tactical_enemy_thin.png"
        _M.faction_danger = "tactical_danger_thin.png"
        _M.faction_powerful = "tactical_powerful_thin.png"
        _M.faction_self = "tactical_self_thin.png"
end
return _M
