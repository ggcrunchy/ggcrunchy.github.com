
-- Modules --
local corona = require("CoronaEmu")
local level_map = require("game.LevelMap")

function love.load()
--[[
	-- Resources
	color =	 {	background = {240,243,247},
				main = {63,193,245},
				text = {76,77,78},
				overlay = {255,255,255,235} }
	font = {	default = love.graphics.newFont(24),
				large = love.graphics.newFont(32),
				huge = love.graphics.newFont(72),
				small = love.graphics.newFont(22) }
]]
	fontimg = love.graphics.newImage("../imgfont.png")
	fontimg:setFilter("nearest","nearest")

	imgfont = love.graphics.newImageFont(fontimg," abcdefghijklmnopqrstuvwxyz0123456789.!'-:·")
	imgfont:setLineHeight(2)

	love.graphics.setFont(imgfont)
--[[logo = love.graphics.newImage("media/logo.png"),
				fmas = love.graphics.newImage("media/fmas.png"),
				set = love.graphics.newImage("media/set.png"),
				notset = love.graphics.newImage("media/notset.png") }
	music =	{	default = love.audio.newSource("media/sawng.ogg") }
	sound =	{	click = love.audio.newSource("media/click.ogg", "static"),
				shush = love.audio.newSource("media/shh.ogg", "static"),
				pling = love.audio.newSource("media/pling.ogg", "static") }

	-- Setup
	love.graphics.setBackgroundColor(unpack(color["background"]))
	love.audio.play(music["default"], 0)
]]
	love.graphics.setBackgroundColor(0xff,0,0)

	level_map.LoadLevel(group, 1)
end

group = display.newGroup()

function love.draw ()
	corona.Draw()

--	state:draw()
end

-- Is this the very first frame? --
local FirstFrame = true

--
function love.update (dt)
	-- This may start out large, so just zero it.
	if FirstFrame then
		dt, FirstFrame = 0
	end

	-- Do Corona-ish update stuff.
	corona.Update(dt)

--	state:update(dt)
end

function love.mousepressed (x, y, button)
--	state:mousepressed(x,y,button)
end

function love.keypressed (key)
	corona.KeyEvent(key, "down")

--	state:keypressed(key)
end

function love.keyreleased (key)
	corona.KeyEvent(key, "up")

--	state:keypressed(key)
end