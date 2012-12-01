
-- Modules --
local corona = require("CoronaEmu")
local level_map = require("game.LevelMap")

function love.load()
--local TimerClass = require("class.Timer")
--[[
	-- Resources
	color =	 {	background = {240,243,247},
				main = {63,193,245},
				text = {76,77,78},
				overlay = {255,255,255,235} }
	font = {	default = love.graphics.newFont(24),
				large = love.graphics.newFont(32),
				huge = love.graphics.newFont(72),
				small = love.graphics.newFont(22) }]]

---[[
	fontimg = love.graphics.newImage("../imgfont.png")
	fontimg:setFilter("nearest","nearest")
	imgfont = love.graphics.newImageFont(fontimg," abcdefghijklmnopqrstuvwxyz0123456789.!'-:·")
	imgfont:setLineHeight(2)

	love.graphics.setFont(imgfont)--]]
--[[logo = love.graphics.newImage("media/logo.png"),
				fmas = love.graphics.newImage("media/fmas.png"),
				set = love.graphics.newImage("media/set.png"),
				notset = love.graphics.newImage("media/notset.png") }
	music =	{	default = love.audio.newSource("media/sawng.ogg") }
	sound =	{	click = love.audio.newSource("media/click.ogg", "static"),
				shush = love.audio.newSource("media/shh.ogg", "static"),
				pling = love.audio.newSource("media/pling.ogg", "static") }
	
	-- Variables
	size = 6				-- size of the grid
	audio = true			-- whether audio should be on or off
	state = Menu.create()	-- current game state
	
	-- Setup
	love.graphics.setBackgroundColor(unpack(color["background"]))
	love.audio.play(music["default"], 0)
]]
love.graphics.setBackgroundColor(0xff,0,0)

level_map.LoadLevel(group, 1)
timer.performWithDelay(1, function()
require("game.PlayerSprites").NewSprite(group, 2, 2)
end)
end

local X = 200
local tt = 0
local XX = X
local bb

group = display.newGroup()

function love.draw ()
	corona.Draw()
--[[
	state:draw()
]]
	local x1 = 200 + 500 * math.cos(tt)
	local x, y, j = x1, 20, 1

--love.graphics.setColor(0, 0, 255)
end

local Dir = 0

-- Is this the very first frame? --
local FirstFrame = true
local n = require("numeric_ops")
--
function love.update (dt)
	-- This may start out large, so just zero it.
	if FirstFrame then
		dt, FirstFrame = 0
	end

	DT = dt

	-- Do Corona-ish update stuff.
	corona.Update(dt)
--	group.x = n.RoundTo(200 + 500 * math.cos(tt))
tt = tt + dt
	X = X + Dir * dt

--[[
	state:update(dt)
]]
end

function love.mousepressed (x, y, button)
--[[
	state:mousepressed(x,y,button)
]]
X = x
end

function love.keypressed (key)
	if key == "left" then
--		X = X - 10
		Dir = Dir - 10
	elseif key == "right" then
--		X = X + 10
		Dir = Dir + 10
	end
	--[[
	if key == "f4" and (love.keyboard.isDown("ralt") or love.keyboard.isDown("lalt")) then
		love.event.push("q")
	end
	
	state:keypressed(key)
]]
end

function love.keyreleased (key)
	if key == "left" then
--		X = X - 10
		Dir = Dir + 10
	elseif key == "right" then
--		X = X + 10
		Dir = Dir - 10
	end
	--[[
	if key == "f4" and (love.keyboard.isDown("ralt") or love.keyboard.isDown("lalt")) then
		love.event.push("q")
	end
	
	state:keypressed(key)
]]
end