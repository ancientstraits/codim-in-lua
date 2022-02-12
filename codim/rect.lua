local cairo = require('codim.cairo')

local M = {}

function M.new(x, y, w, h, color)
    return setmetatable({
        x = x,
        y = y,
        w = w,
        h = h,
        color = color,
    }, {__index = M})
end

function M:draw(cr)
    cairo.set_source_rgba(cr, unpack(self.color))
    cairo.rectangle(cr, self.x, self.y, self.w, self.h)
    cairo.fill(cr)
end

function M:wait(seconds)
    local time = 0
    local drawn = false
    return function(cr, fps)
        if not drawn then
            drawn = true
        end
        self:draw(cr)
        time = time + 1
        return (time / fps) < seconds
    end
end

function M:move_relative(x, y, seconds)
    self:move(self.x + x, self.y + y, seconds)
end

function M:move(x, y, seconds)
    -- TODO: remove hardcoded FPS
    local xdiff = (x - self.x) / (24 * seconds)
    local ydiff = (y - self.y) / (24 * seconds)
    local time = 0
    return function(cr, fps)
        self.x = self.x + xdiff
        self.y = self.y + ydiff
        self:draw(cr)
        time = time + 1
        return time < fps * seconds
    end
end


return M