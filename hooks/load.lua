local Dialog = require "engine.ui.Dialog"
local Textzone = require "engine.ui.Textzone"

-- Initialize setting on addon load
class:bindHook("ToME:load", function(self, data)
        config.settings.tome.ascii_border_style = config.settings.tome.ascii_border_style or "thick"
end)

-- Ascii border style menu option
class:bindHook("GameOptions:generateList", function(self, data)
        if data.kind == "ui" then
                local zone = Textzone.new{
                        width = self.c_desc.w,
                        height = self.c_desc.h,
                        text = string.toTString[[Select which ascii border style you would like to use:
 - Default is exactly the default 32x32 ascii borders.
 - Thick is a scaled and consistent 64x64 version of the default ascii borders.
 - Thin is the same as the default ascii borders except in a 64x64 size.]]
                }
                data.list[#data.list+1] = {
                        zone = zone,
                        name = string.toTString"#GOLD##{bold}#Ascii Border Style#WHITE##{normal}#",
                        status = function(item)
                                return tostring(config.settings.tome.ascii_border_style):capitalize()
                        end,
                        fct = function(item)
                                local list = {{name="Default", style="default"}, {name="Thick", style="thick"}, {name="Thin", style="thin"}}
                                engine.ui.Dialog:listPopup("Ascii border style", "Select style", list, 300, 200, function(sel)
                                        if not sel or not sel.style then return end
                                        config.settings.tome.ascii_border_style = sel.style
                                        game:saveSettings("tome.ascii_border_style", ("tome.ascii_border_style = %q\n"):format(config.settings.tome.ascii_border_style))
                                        self.c_list:drawItem(item)
                                end)
                        end,
                }
        end
end)
