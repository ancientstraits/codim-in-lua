#!/usr/bin/env luajit

local Writer = require('codim.writer')
local Rect = require('codim.rect')
local color = require('codim.color')

local w = Writer.new(600, 400, 24)
w:open('out.mp4')

local bg = Rect.new(0, 0, 600, 400, color.hex('0000ff'))
w:add({bg:wait(2)}, 0)

local r = Rect.new(20, 30, 42, 49, color.hex('000000'))
w:add({r:wait(2)}, 0)

w:play()

w:close()