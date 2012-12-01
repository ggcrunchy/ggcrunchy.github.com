--- The main functionality behind our heroic spaceman.

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
local abs = math.abs
local min = math.min
--local pairs = pairs
local random = math.random
local sin = math.sin

-- Modules --
local ai = require("game.AI")
--local audio = require("game.Audio")
--local collision = require("game.Collision")
local dispatch_list = require("game.DispatchList")
local frames = require("game.Frames")
--local fx = require("game.FX")
--local hud = require("game.HUD")
local pathing = require("game.Pathing")
local path_utils = require("game.PathUtils")
--local persistence = require("game.Persistence")
local player_sprites = require("game.PlayerSprites")
--local scenes = require("game.Scenes")
local scrolling = require("game.Scrolling")
--local stars = require("effect.Stars")
local tile_flags = require("game.TileFlags")
local tile_maps = require("game.TileMaps")

-- Deferred modules --
local level_map

timer.performWithDelay(0, function()
	level_map = require("game.LevelMap")
end)

-- Classes --
local TimerClass = require("class.Timer")

-- Corona globals --
--local display = display
--local transition = transition

-- Exports --
local M = {}

-- Number of hit points --
local HitPoints

-- How many lives remain? --
local LivesLeft

-- Puts the player fresh at the starting tile
local function PutAtStart (player)
	player:PutAtStart()

	-- Set initial hit points.
--	player.m_hp = HitPoints

	-- Update the lives in the HUD.
--	hud.SetLivesCounter(LivesLeft)

	-- Provide fresh timers.
	player.m_mercy = TimerClass()
	player.m_stun = TimerClass()
end

-- Sounds played during player actions --
--local Sounds = audio.NewSoundGroup{ ko = "PlayerKO.mp3", nuts = "Nuts.ogg", ow = "Ow.ogg", uff = "Uff.ogg" }

-- Player state --
local Player

--- Adds our heroic protagonist to a new level.
-- @pgroup group Display group that will hold the squirrel parts.
-- @uint col Column of starting tile.
-- @uint row Row of starting tile.
function M.AddPlayer (group, col, row)
	Player = player_sprites.NewSprite(group, col, row)

	Player.m_touching = {}

	PutAtStart(Player)
end

-- Current segment used to build a path, if any --
local Cur

-- The goal position of any path in progress --
local Goal

-- Graphics used to mark a path destination --
local X1, X2

--- If a path is in progress, cancels it; otherwise, this is a no-op.
function M.CancelPath ()
if true then return end
	display.remove(X1)
	display.remove(X2)

	ai.WipePath(Player:GetFeet())

	Cur, Goal, X1, X2 = nil
end

--- Acts on any objects that the player is touching.
function M.DoActions ()
	local facing = Player:GetFacing()

	for object in pairs(Player.m_touching) do
		dispatch_list.CallList("act_on_dot", object, facing)
	end
end

---@treturn number Player's x-coordinate...
-- @treturn number ...and y-coordinate.
function M.GetPos ()
	local feet = Player:GetBody()--GetFeet()

	return feet.x, feet.y
end

---@treturn number Goal's x-coordinate, or **nil** if no goal exists...
-- @treturn number ...and y-coordinate.
-- @treturn int Goal tile.
function M.GoalPos ()
	if Goal then
		return Goal.x, Goal.y, Goal.tile
	else
		return nil
	end
end

---@treturn boolean The player is following a path?
function M.IsFollowingPath ()
	return Goal ~= nil
end

--- Kill the player on demand.
function M.Kill ()
	dispatch_list.CallList("player_killed", Player)
end

-- Distance that player can travel per second --
local Speed = 20--125

-- Updates the player on tile movement
local function UpdateOnMove (dir, tile)
	Cur = path_utils.Advance(Cur, "facing", dir)

	Goal.tile = tile

	return path_utils.CurrentDir(Cur)
end

-- Near goal distance --
local NearGoal

--- Attempts to move the player in a given direction, at some average squirrel velocity.
--
-- The **"player\_tried\_to\_move"** list is then dispatched, with _dist_ and _dir_ as
-- arguments, where _dist_ is the maximum distance Spaceman could travel on this frame.
-- @string dir Direction in which to move.
-- @see game.Movement.NextDirection
function M.MovePlayer (dir)
	local dist = Speed * frames.DiffTime()

	Player:TryToMove(dist, dir, NearGoal, M, UpdateOnMove)

	dispatch_list.CallList("player_tried_to_move", dist, dir)
end

-- Helper to report object-specific deadliness
local function IsDeadly (object, object_type)
	if Player.m_mercy:GetDuration() then
		return
	elseif object_type == "enemy" then
		return object.m_alive
	else
		return object.IsDeadly and object:IsDeadly()
	end
end

-- One of the groups used to hold stun stars --
local StarsFront

-- Helper to stop stun stars, if active
local function CancelStars ()
	display.remove(StarsFront)

	StarsFront = nil
end

-- Per-frame setup / update
local function OnEnterFrame ()
	-- If on a path, progress along it. Otherwise, try to wind down the animation.
	if Cur then
		M.MovePlayer(path_utils.CurrentDir(Cur))
	else
		Player:WindDownAnimation()
	end
end

-- Layer onto which pathing graphics are planted --
local MarkersLayer

-- Reference group for tap and scroll coordinates --
local RefGroup

-- Helper to activate collision
local function Activate (active)
	Player.m_is_busy = not active

	collision.Activate(Player:GetFeet(), active)
end

-- Helper to kick off reset
local function Reset ()
	dispatch_list.CallList("pre_reset")
	dispatch_list.CallList("reset_level")
	dispatch_list.CallList("post_reset")
end

-- Spinning death transition --
local DeadParams = {
	time = 3000, rotation = 360 * 15, transition = easing.outExpo,

	onComplete = function(object)
		object.rotation = 0

		-- Kick off the reset after some part has stopped spinning.
		if object == Player:GetBody() and object.parent then
			if LivesLeft > 1 then
				scenes.Send("message:show_overlay", "overlay.KO", Reset)
			else
				level_map.UnloadLevel("lost")
			end
		end
	end
}

-- Mercy invincibility time, after being hurt --
local MercyTime = 1.3

-- Time left immobile when stunned --
local StunTime = 2.5

-- Listen to events.
dispatch_list.AddToMultipleLists{
	-- Enter Level --
	enter_level = function(level)
		MarkersLayer = level.markers_layer
		NearGoal = min(level.w, level.h) / 3
--[[
		Sounds:Load()

		local config = persistence.GetConfig()

		HitPoints = config.hit_points
		LivesLeft = config.lives
]]
		Runtime:addEventListener("enterFrame", OnEnterFrame)
	end,

	-- Leave Level --
	leave_level = function()
--		M.CancelPath()

		Player, RefGroup = nil

		Runtime:removeEventListener("enterFrame", OnEnterFrame)
	end,

	-- Move Done --
	move_done = function()
		Activate(true)

		scrolling.Follow(Player:GetFeet(), "keep")
	end,

	-- Move Done Moving --
	move_done_moving = function(_, to)
		Player:Place(to.x, to.y)
	end,

	-- Move Prepare --
	move_prepare = function(from)
		from:AddItem(Player:GetBody())

		Activate(false)

		M.CancelPath()

		scrolling.Follow(Player:GetBody(), "keep")
	end,

	-- Player Hurt --
	player_hurt = function()
		Player.m_hp = Player.m_hp - 1

		Player.m_mercy:Start(MercyTime)

		Sounds:PlaySound(random(3) == 1 and "uff" or "ow")
	end,

	-- Player Killed --
	player_killed = function()
		transition.to(Player:GetBody(), DeadParams)

		Sounds:PlaySound("ko")

		if random(5) <= 2 then
			Sounds:PlaySound("nuts", 1200)
		end

		collision.Activate(Player:GetFeet(), false)

		CancelStars()

		M.CancelPath()
	end,

	-- Player Stunned --
	player_stunned = function()
		Player.m_stun:Start(StunTime)

		M.CancelPath()

		CancelStars()
-- TODO: Bonk sound
		local body = Player:GetBody()

		StarsFront = stars.RingOfStars(body.parent, 4, body.x, body.y - 20, 45, 9)
	end,

	-- Reset Level --
	reset_level = function()
		LivesLeft = LivesLeft - 1

		PutAtStart(Player)
		Activate(true)
	end,

	-- Tapped At --
	tapped_at = function(x, y)
		x, y = x - RefGroup.x, y - RefGroup.y

		-- If we tapped on a tile, plan a path to it.
		local tile = tile_maps.GetTileIndex_XY(x, y)

		if tile_flags.IsOnPath(tile) then
			M.CancelPath()

			local ftile = tile_maps.GetTileIndex_XY(M.GetPos())
			local paths = pathing.FindPath(ftile, tile)

			if paths then
				local px, py = tile_maps.GetTilePos(tile)

				if tile_flags.IsFlagSet(tile, x < px and "left" or "right") then
					px = x
				end

				if tile_flags.IsFlagSet(tile, y < py and "up" or "down") then
					py = y
				end

				Cur = path_utils.ChooseBranch_Facing(paths, Player:GetFacing())
				Goal = { x = px, y = py, tile = ftile }

				-- X marks the spot!
				X1 = display.newLine(MarkersLayer, x - 15, y - 15, x + 15, y + 15)
				X2 = display.newLine(MarkersLayer, x - 15, y + 15, x + 15, y - 15)

				X1:setColor(255, 0, 0)
				X2:setColor(255, 0, 0)

				X1.width = 4
				X2.width = 8
			end

		-- Otherwise, play some sparkles just to give some feedback on the tap.
		else
			fx.Sparkle(MarkersLayer, x, y)
		end
	end,

	-- Things Loaded --
	things_loaded = function(level)
		RefGroup = level.game_group

--		scrolling.Follow(Player:GetBody()--[[GetFeet()]], RefGroup)
	end,

	-- Touching Dot --
	touching_dot = function(dot, touch)
		Player.m_touching[dot] = touch or nil
	end
}

-- Export the module.
return M