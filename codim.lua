#!/usr/bin/env luajit

local Writer = require('codim.writer')
local Rect = require('codim.rect')
local color = require('codim.color')
local cairo_utils = require('codim.cairo_utils')

local w = Writer.new(600, 400, 24)
w:open('out.mp4')

local bg = Rect.new(0, 0, 600, 400, color.hex('0000ff'))
w:add({bg:wait(2)}, 0)

local r = Rect.new(20, 20, 50, 50, color.hex('00ff00'))
w:add({r:move(100, 100, 2)}, 0)
-- w:add({r:wait(2)}, 0)

w:play()

w:close()