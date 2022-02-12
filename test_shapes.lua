local cairo = require('codim.cairo')

local surface = cairo.image_surface_create(cairo.FORMAT_ARGB32, 600, 400)
local cr = cairo.create(surface)

cairo.set_source_rgb(cr, 0.0, 0.5, 0.7)
cairo.rectangle(cr, 0, 0, 600, 400)
cairo.fill(cr)

-- cairo.surface_write_to_png(surface, 'image.png')
cairo.surface_flush(surface)
local data = cairo.image_surface_get_data(surface)
local stride = cairo.image_surface_get_stride(surface)
for i=0,3 do
    print(data[i])
end
for i=3,0,-1 do
    print(data[(stride * 200) + (200 * 4) + i])
end
-- for i = 1,(600 * 400 * 4) do
--     print(string.format('%d: %d', i, data[i]))
-- end

cairo.destroy(cr)
cairo.surface_destroy(surface)