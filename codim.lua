#!/usr/bin/env luajit

local Writer = require('codim.writer')
local Rect = require('codim.rect')
local color = require('codim.color')

local w = Writer.new(600, 400, 24)
w:open('out.mp4')
w.frame:fill(color.hex('00ff00'))
local rect = Rect.new(20, 20, 34, 10, color.hex('000000'))
local rect2 = Rect.new(100, 100, 34, 10, color.hex('0000ff'))
w:play{rect:wait(1), rect2:move(-50, 50, 1)}
w:play{rect:move(100, 100, 1), rect2:wait(1)}
w:close()