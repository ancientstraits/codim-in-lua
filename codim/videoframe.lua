local cairo = require('codim.cairo')

local M = {}

function M.new(w, h)
    local csurf = cairo.image_surface_create(cairo.FORMAT_ARGB32, w, h)
    local cairo = cairo.create(csurf)
    return setmetatable({
        csurf = csurf,
        cairo = cairo,
        frameno = 0,
    }, {__index = M})
end

function M:fill(color)
    for i = 1,self.h do
        self[i] = {}
        for j = 1,self.w do
            self[i][j] = color
        end
    end
end

function M:rect(x, y, w, h, color)
    for i = y,y+h do
        for j = x,x+w do
            self[i][j] = color
        end
    end
end

function M:write(f, times)
    for i = 1,times do
        for _, row in ipairs(self) do
            for _, px in ipairs(row) do
                for _, val in ipairs(px) do
                    f:write(string.char(val))
                end
            end
        end
        print(string.format('[%d/%d]', i + self.frameno, times + self.frameno))
    end
    self.frameno = times
end

return M