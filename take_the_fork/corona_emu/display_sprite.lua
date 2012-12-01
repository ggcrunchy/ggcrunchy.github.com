--- This module emulates some of Corona's sprite object logic.

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

-- Standard libary imports --
local floor = math.floor
local min = math.min

-- Modules --
local display_object = require("corona_emu.display_object")
local system = require("corona_emu.system")
local utils = require("corona_emu.utils")

-- Corona globals --
local lg = love.graphics

-- Exports --
local M = {}

-- --
local SpriteMT

--
local function AddSequence (sequences, data)
	local sequence, frames = { name = data.name, time = data.time, loop_count = data.loopCount or 0, dir = data.loopDirection or "forward" }, data.frames

	if frames then
		for _, v in ipairs(frames) do
			sequence[#sequence + 1] = v
		end
	else
		for i = data.start, data.start + data.count - 1 do
			sequence[#sequence + 1] = i
		end
	end

	-- sheet: do _quads-ish thing

	sequences[#sequences + 1] = sequence
end

---
function M.New (parent, image_sheet, sequence_data)
	if sequence_data == nil then
		parent, image_sheet, sequence_data = utils.GetStage(), parent, image_sheet
	end

	--
	local sequences, first = {}, sequence_data.name or sequence_data[1].name

	if #sequence_data > 0 then
		for _, data in ipairs(sequence_data) do
			AddSequence(sequences, data)
		end
	else
		AddSequence(sequences, sequence_data)
	end

	--
	local sprite = setmetatable(display_object.NewObject(), SpriteMT)

	sprite._sequences = sequences
	sprite._sheet = image_sheet

	parent:insert(sprite)

	--
	sprite:setSequence(first)

	return sprite
end

-- --
local SpriteMethods, SpriteProperties = {}, {}

display_object.Populate(SpriteMethods, SpriteProperties)

--
local function CurrentSequence (sprite)
	return sprite._sequences[sprite._index]
end

--
local function CurrentQuad (sprite)
	local sheet = sprite._sheet
	local quad, sx, sy = sheet:GetQuad(CurrentSequence(sprite)[sprite.frame])
	local _, _, qw, qh = quad:getViewport()

	return quad, qw, qh, sheet, sx, sy
end

--
function SpriteMethods:OnDraw (x, y, w, h, alpha)
	local quad, qw, qh, sheet, sx, sy = CurrentQuad(self)

	lg.drawq(sheet:GetGraphic(), quad, x + sx, y + sy, math.rad(self.rotation), 1, 1, qw / 2, qh / 2)
	-- ^^??
end

--
local Keys = { "_ending", "_frame", "_index", "_loops_left", "_paused", "_sequences", "_sheet", "_since", "_time_scale" }

--
function SpriteMethods:OnRemove ()
	utils.RemoveKeys(self, Keys)
end

--
local function Sync (sprite)
	local loops_left = sprite._loops_left

	--
	if sprite._paused or sprite._syncing or loops_left == 0 then
		return
	end

	--
	local sequence, now, since = CurrentSequence(sprite), system.getTimer(), sprite._since
	local diff = (now - since) * sprite.timeScale -- cap?
	local timeout = sequence.time or 300 --?? "frame rate of the application"...
	local can_bounce, ending = sequence.dir == "bounce", sprite._ending
	local frame, nframes = sprite._frame or 1, #sequence

	--
	local count = floor(diff / timeout)

	while count > 0 do
		local delta = (can_bounce and ending) and -1 or 1

		count, diff, frame = count - 1, diff - timeout, frame + delta

		--
		local final_frame, phase = bouncing and 1 or nframes, "next"
		local could_finish = ending and loops_left == 1

		if frame == final_frame + (could_finish and 0 or delta) then
			if ending then
				loops_left = loops_left and loops_left - 1
			end

			--
			if loops_left == 0 then
				count, name = 0, "ended"
			elseif can_bounce then
				ending, frame, name = not ending, final_frame, "bounce"
			else
				frame, name = 1, "loop"
			end
		end

		--
		sprite._frame, sprite._syncing = frame, true

		sprite:dispatchEvent{ name = "sprite", phase = phase, target = sprite }

		sprite._syncing = false
	end

	sprite._ending, sprite._loops_left, sprite._since = ending, loops_left, now - diff
end

--
function SpriteMethods:pause ()
	if not self._paused then
		Sync(self)
	end

	self._paused = true
end

--
local function HasFramesLeft (sprite)
	local sequence = CurrentSequence(sprite)

	return sprite.frame < #sequence or sequence._loops_left ~= 0
end

--
function SpriteMethods:play ()
	if self._paused then
		if self._since == nil then
			self:dispatchEvent{ name = "sprite", phase = "began", target = self }
		end

		self._since = system.getTimer()
	end

	self._paused = false
end

--
function SpriteMethods:setFrame (index)
	self._frame, self._since = index, system.getTimer()
end

--
function SpriteMethods:setSequence (name)
	--
	if name then
		for i, v in ipairs(self._sequences) do
			if v.name == name then
				self._index = i

				break
			end
		end
	end

	--
	local sequence = CurrentSequence(self)
	local loop_count = sequence.loop_count or 0

	self._ending = sequence.dir ~= "bounce"
	self._frame = nil
	self._loops_left = loop_count ~= 0 and loop_count
	self._paused = true

	self:setFrame(1)
end

--
function SpriteProperties:frame (_, v)
	if v == nil then
		Sync(self)

		return self._frame
	end
end

--
function SpriteProperties:height (_, v)
	if v == nil then
		local _, _, qh = CurrentQuad(self)

		return qh
	end
end

--
function SpriteProperties:isPlaying (_, v)
	if v == nil then
		return not self._paused and HasFramesLeft()
	end
end

--
function SpriteProperties:numFrames (_, v)
	if v == nil then
		return #CurrentSequence(self)
	end
end

--
function SpriteProperties:sequence (_, v)
	if v == nil then
		return CurrentSequence(self).name
	end
end

--
function SpriteProperties:timeScale (_, v)
	if v == nil then
		return self._time_scale or 1
	else
		Sync(self)

		self._time_scale = v
	end
end

--
function SpriteProperties:width (_, v)
	if v == nil then
		local _, qw, _ = CurrentQuad(self)

		return qw
	end
end

SpriteMT = utils.NewMetatable(SpriteMethods, SpriteProperties)

-- Export the module.
return M