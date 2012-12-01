--- Our squirrel's sprites and related functionality.

--
-- Permission is hereby granted, free of charge, to any person obtaining
-- a copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
--
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
-- CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- [ MIT license: http://www.opensource.org/licenses/mit-license.php ]
--

-- Standard library imports --
--local pairs = pairs

-- Modules --
local ai = require("game.AI")
--local collision = require("game.Collision")
local sheet = require("ui.Sheet")
local tile_maps = require("game.TileMaps")

-- Corona globals --
--local display = display

-- Exports --
local M = {}

-- Player methods --
local Player = {}

--- Point our squirrel in a given direction.
-- @string dir Name of the direction to face, cf. @{game.Movement.NextDirection}.
function Player:Face (dir)
	if self.m_facing ~= dir then
		self.m_facing = dir

		-- Put the tail in front of / behind the body as appropriate.
--[[
		local tail = self.m_tail

		if dir == "up" then
			tail:toFront()
		else
			tail:toBack()
		end
]]
		-- If we're facing right, flip the body sprite, and the tail to match. Otherwise,
		-- these should be okay.
		local hscale = dir == "right" and -1 or 1
		local body = self.m_body

		body.xScale = hscale
--		tail.xScale = hscale

		-- Prepare the appropriate animation sequence for the body.
		if dir == "left" or dir == "right" then
			dir = "side"
		end

		body:setSequence("moving")--dir)
		body:play()
	end
end

--- @treturn DisplayObject Body sprite.
function Player:GetBody ()
	return self.m_body
end

--- @treturn string Facing direction, as per @{Player:Face}. By default, **"down"**.
function Player:GetFacing ()
	return self.m_facing
end
--[[
--- @treturn DisplayObject Feet object.
function Player:GetFeet ()
	return self.m_feet
end

--- @treturn DisplayObject Tail sprite.
function Player:GetTail ()
	return self.m_tail
end
]]
-- Helper to put squirrel part at a position
local function PutPart (part, x, y)
	part.x, part.y = x, y
end

-- Places our squirrel somewhere.
-- @number x
-- @number y
function Player:Place (x, y)
--	PutPart(self.m_feet, x, y)

	-- Place the body, centered a little higher than the feet.
	local tilew, tileh = tile_maps.GetSizes()
	local by = y - tileh / 4

	PutPart(self.m_body, x, by)

	-- Pin the tail on the squirrel, a little to the side of the body.
	local dx = tilew / 4

	if self.m_facing == "right" then
		dx = -dx
	end

--	PutPart(self.m_tail, x + dx, by)
end

-- Puts the player fresh at the starting tile.
function Player:PutAtStart ()
	self:Face("down")
	self:Place(tile_maps.GetTilePos(self.m_start))

	self.m_frames_left = 0
end

--- Attempts to move the player in a given direction.
-- @number dist
-- @string dir Direction in which to move.
-- @number near_goal
-- @ptable path_funcs
-- @callable update_on_move
-- @see game.Movement.NextDirection
function Player:TryToMove (dist, dir, near_goal, path_funcs, update_on_move)
	-- Try to walk a bit.
	local moved, x2, y2, dir2 = ai.TryToMove(self.m_feet, dist, dir, near_goal, path_funcs, update_on_move)

	-- Face the direction we at least tried to move.
	self:Face(dir2)

	-- If we did move, update the animation.
	if moved then
		self.m_frames_left = 2

		self.m_body:play()
	end

	-- Finally, put the body and tail relative to the feet.
	self:Place(x2, y2)
end

--- Winds down any body animation in progress.
function Player:WindDownAnimation ()
	if self.m_frames_left > 0 then
		self.m_frames_left = self.m_frames_left - 1

		if self.m_frames_left == 0 then
			self.m_body:setSequence()
			self.m_body:pause()
		end
	end
end

-- Player sprite factory --
local Sprites = sheet.NewSpriteFactory("media/Spaceman.png", {
	frames = require("tiles.Spaceman"),

	-- Player sprites --
	m_sprites = {
		{ name = "idle", start = 1, count = 1 },
		{ name = "moving", start = 2, count = 3, time = 350, loopCount = 0 }
--[[
		{ name = "up", start = 1, count = 3, time = 850, loopCount = 0 },
		{ name = "down", start = 4, count = 3, time = 850, loopCount = 0 },
		{ name = "side", start = 7, count = 3, time = 850, loopCount = 0 },
		{ name = "tail", start = 10, count = 2, time = 450, loopCount = 0 }
]]
	}
})

-- Player collision filter --
--local Filter = { categoryBits = collision.FilterBits("player"), maskBits = 0xFFFF }

-- Collision radius of feet --
local Radius = 15

--- DOCME
-- @pgroup group
-- @uint col
-- @uint row
-- @string ctype
-- @ptable filter
-- @treturn DisplayObject X
function M.NewSprite (group, col, row, ctype, filter)
	local player = { m_start = tile_maps.GetTileIndex(col, row) }

	-- Add methods.
	for k, v in pairs(Player) do
		player[k] = v
	end

	-- Add the body and tail sprites. Fire-and-forget the tail animation.
	player.m_body = Sprites:NewSprite(group)
--	player.m_tail = Sprites:NewSprite(group)

--	player.m_tail:setSequence("tail")
--	player.m_tail:play()
--[[
	-- Add collision around the feet: this is appropriate for detecting dots, and reasonable
	-- when it comes to other collisions.
	player.m_feet = display.newCircle(group, 0, 0, Radius)

	player.m_feet.isVisible = false
]]
	-- Put the squirrel on the starting tile.
	player:PutAtStart()

	-- Activate collision.
--	collision.MakeSensor(player.m_feet, "dynamic", { filter = filter or Filter, radius = Radius })
--	collision.SetType(player.m_feet, ctype or "player")

	return player
end

-- Export the module.
return M