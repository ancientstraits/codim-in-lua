#!/usr/bin/env luajit

local cm = require('codim')

local w = cm.writer.new(600, 400, 24)
w:open('out.mp4')

local bg = cm.rect.new(0, 0, 600, 400, cm.color.hex('00a0a0'))
w:add({bg:wait(12)}, 0)

w:add({cm.text.new([[
int isImproving = 1;
const AVRational difficulty = {1000, 1};
local ease = true
os.execute('ffmpeg')
local unstable = true
function improving() return true end
]], 20, 20, cm.color.hex('ffffff')):type_duration(25, 0)}, 0)
-- w:add({t:type(1, 0)}, 0)

w:play()

w:close()

cm.tts.say('out.mp4', {
    {'Much progress has been made on codim since the last update.', 0},
    {'When using C, I tried to add audio support, but I kept encountering problems with the FFmpeg C API.', 5},
    {'That is when I decided that I would move to Lua for the time being. It was far easier to use.', 13},
    {'I also am using the FFmpeg CLI in this version.', 19},
    {'This version is also finnicky, but at least it is progress.', 23},
})