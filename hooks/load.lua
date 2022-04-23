local Dialog = require "engine.ui.Dialog"
local Textzone = require "engine.ui.Textzone"
local Map = require "engine.Map"

-- Initialize setting on addon load
class:bindHook("ToME:load", function(self, data)
        config.settings.tome.ascii_border_style = config.settings.tome.ascii_border_style or "thick"

        local style = config.settings.tome.ascii_border_style or "thick"

        if style == "official" then
                Map.faction_danger2 = "tactical_danger_official.png"
                Map.faction_danger1 = "tactical_enemy_strong_official.png"
        end
        if style == "thick" then
                Map.faction_danger2 = "tactical_danger_thick.png"
                Map.faction_danger1 = "tactical_enemy_strong_thick.png"
        end
        if style == "thin" then
                Map.faction_danger2 = "tactical_danger_thin.png"
                Map.faction_danger1 = "tactical_enemy_strong_thin.png"
        end
end)

-- ASCII border style menu option
class:bindHook("GameOptions:generateList", function(self, data)
        if data.kind == "ui" then
                local zone = Textzone.new{
                        width = self.c_desc.w,
                        height = self.c_desc.h,
                        text = string.toTString[[Select which ASCII border style you would like to use:
 - Official is exactly the default 32x32 ASCII borders.
 - Thick is a scaled and consistent 64x64 version of the official ASCII borders.
 - Thin is the official ASCII borders except in a 64x64 size.
#LIGHT_RED#This will take effect on next restart.]]
                }
                data.list[#data.list+1] = {
                        zone = zone,
                        name = string.toTString"#GOLD##{bold}#ASCII Border Style#WHITE##{normal}#",
                        status = function(item)
                                return tostring(config.settings.tome.ascii_border_style):capitalize()
                        end,
                        fct = function(item)
                                local list = {{name="Official", style="official"}, {name="Thick", style="thick"}, {name="Thin", style="thin"}}
                                engine.ui.Dialog:listPopup("ASCII Border Style", "Select style", list, 300, 200, function(sel)
                                        if not sel or not sel.style then return end
                                        config.settings.tome.ascii_border_style = sel.style
                                        game:saveSettings("tome.ascii_border_style", ("tome.ascii_border_style = %q\n"):format(config.settings.tome.ascii_border_style))
                                        self.c_list:drawItem(item)
                                end)
                        end,
                }
        end
end)
