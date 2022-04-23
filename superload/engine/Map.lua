local _M = loadPrevious(...)

-- superloaded code
local style = config.settings.tome.ascii_border_style

if style == "official" then
        _M.faction_friend = "tactical_friend_official.png"
        _M.faction_neutral = "tactical_neutral_official.png"
        _M.faction_enemy = "tactical_enemy_official.png"
        _M.faction_danger = "tactical_danger_official.png"
        _M.faction_powerful = "tactical_powerful_official.png"
        _M.faction_self = "tactical_self_official.png"
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
