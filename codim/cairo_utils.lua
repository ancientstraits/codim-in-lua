local cairo = require('codim.cairo')

local M = {}

function M.fill(cr, color)
    M.rect(cr, 0, 0,
        cairo.image_surface_get_width(cr),
        cairo.image_surface_get_height(cr),
    color)
end

function M.rect(cr, x, y, width, height, color)
    cairo.set_source_rgba(cr, unpack(color))
    cairo.rectangle(cr, x, y, width, height)
    cairo.fill(cr)
end

return M