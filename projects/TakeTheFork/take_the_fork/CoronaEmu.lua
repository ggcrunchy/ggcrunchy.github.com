--- This module emulates various Corona API's through Love WebPlayer.

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
local floor = math.floor

-- Modules --
local display = require("corona_emu.display")
local easing = require("corona_emu.easing")
local event_listener = require("corona_emu.event_listener")
local graphics = require("corona_emu.graphics")
local system = require("corona_emu.system")
local timer = require("corona_emu.timer")
local transition = require("corona_emu.transition")
local utils = require("corona_emu.utils")

-- Exports --
local M = {}

-- --
local Methods = {}

event_listener.Populate(Methods)

local Runtime = setmetatable({}, utils.NewMetatable(Methods))

--- DOCME
function M.Draw ()
	local stage = utils.GetStage()

	if stage.isVisible then
		stage:OnDraw(0, 0, display.contentWidth, display.contentHeight, 1)
	end
end

-- --
local KeyEvent = { name = "key" }

--- DOCME
-- @string key
-- @string phase
function M.KeyEvent (key, phase)
	KeyEvent.keyName = key
	KeyEvent.phase = phase

	Runtime:dispatchEvent(KeyEvent)
end

--- DOCME
-- @number x
-- @number y
-- @int button
function M.MousePressed (x, y, button)
end

-- Per-frame Runtime-issued event --
local EnterFrameEvent = { name = "enterFrame" }

--- DOCME
-- @param dt
function M.Update (dt)
	dt = floor(dt * 1000 + .5)

	-- Send the enter-frame event.
	EnterFrameEvent.time = system.getTimer()

	Runtime:dispatchEvent(EnterFrameEvent)

	-- Update timers and transitions.
	timer.Update(dt)
	transition.Update(dt)

	-- Drive physics?

	-- Update the system timer.
	system.Update(dt)
end

-- Inject into globals.
_G.display = display
_G.easing = easing
_G.graphics = graphics
_G.system = system
_G.timer = timer
_G.transition = transition
_G.Runtime = Runtime

-- Export the module.
return M