local _M = loadPrevious(...)

-- save the original init function
local base_init = _M.init

-- set the target cursor
function _M:init(map, source_actor)

        -- execute the original function
        local retval = base_init(self, map, source_actor)
        
        -- superloaded code
        local style = config.settings.tome.ascii_border_style or "thick"

        if style == "official" then
                self.cursor = engine.Tiles:loadImage("target_cursor_official.png"):glTexture()
        end
        if style == "thick" then
                self.cursor = engine.Tiles:loadImage("target_cursor_thick.png"):glTexture()
        end
        if style == "thin" then
                self.cursor = engine.Tiles:loadImage("target_cursor_thin.png"):glTexture()
        end

        -- return original function
        return retval
end

return _M
