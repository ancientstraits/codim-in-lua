local gl   = require('moongl')
local glfw = require('moonglfw')

glfw.window_hint('context version major', 3)
glfw.window_hint('context version minor', 3)
glfw.window_hint('opengl profile', 'core')

local window = glfw.create_window(600, 400, 'hello')
glfw.make_context_current(window)
gl.init()

glfw.set_window_size_callback(window, function(_, w, h)
	gl.viewport(0, 0, w, h)
end)

while not glfw.window_should_close(window) do
	glfw.poll_events()
	gl.clear_color(0.0, 0.4, 0.6, 1.0)
	gl.clear("color", "depth")
	glfw.swap_buffers(window)
end
