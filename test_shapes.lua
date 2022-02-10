local cairo = require('codim.cairo')

local surface = cairo.image_surface_create(cairo.FORMAT_ARGB32, 600, 400)
local cr = cairo.create(surface)

cairo.set_source_rgb(cr, 0.0, 0.5, 0.7)
cairo.set_line_width(cr, 1)

cairo.

cairo.destroy(cr)
cairo.surface_destroy(surface)