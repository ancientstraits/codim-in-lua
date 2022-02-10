local M = {}

local VideoFrame = require('codim.videoframe')

function M.new(w, h, fps)
    return setmetatable({
        frame = VideoFrame.new(w, h),
        fps = fps,
    }, {__index = M})
end

function M:open(out)
    self.process = io.popen(table.concat({
        'ffmpeg',
        '-y', -- overwrite
        '-f', 'rawvideo', -- accept raw video
        '-pix_fmt', 'argb', -- the pixel format needs 4 components
        '-s', string.format('%dx%d', self.frame.w, self.frame.h), -- resolution
        '-r', tostring(self.fps), -- framerate
        '-i', '-', -- use pipe for input
        '-an', -- no audio
        out, -- the output file
    }, ' '), 'w')
end

function M:close()
    self.process:close()
end

function M:wait(seconds)
    self.frame:write(self.process, math.floor(seconds * self.fps))
end

return M