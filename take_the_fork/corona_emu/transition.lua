--- This module emulates some of Corona's transition module.

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

-- Modules --
local easing = require("corona_emu.easing")
local system = require("corona_emu.system")
local utils = require("corona_emu.utils")

-- Exports --
local M = {}

---
function M.cancel (handle)
	handle._cancel = true
end

-- Active transitions --
local Transitions = {}

---
function M.to (target, params)
	local transition, time = {}

	for k, v in pairs(params) do
		if k == "time" then
			time = v
		elseif k == "onComplete" or k == "transition" then
			transition[k] = v
		else
			local v0 = target[k]

			transition[#transition + 1] = k
			transition[#transition + 1] = v0
			transition[#transition + 1] = v - v0
		end
	end

	transition._duration = time or 500
	transition._target = target
	transition._timeStart = system.getTimer()

	Transitions[#Transitions + 1] = transition

	return transition
end

-- Updates the target at a given time
local function UpdateTarget (transition, when)
	local target, duration, tfunc = transition._target, transition._duration, transition._transition or easing.linear

	for i = 1, #transition, 3 do
		target[transition[i]] = tfunc(when, duration, transition[i + 1], transition[i + 2])
	end
end

--- DOCME
-- @uint dt
function M.Update (dt)
	local index, now = 1, system.getTimer()

	for _, transition in ipairs(Transitions) do
		local when = now - transition._timeStart

		-- Aborted or completed transition: in the latter case, update it for t = 1 and
		-- do any on-complete logic. The transition is not re-added to the list.
		if transition._cancel or when >= transition._duration then
			if not transition._cancel then
				UpdateTarget(transition, transition._duration)

				if transition.onComplete then
					transition.onComplete(transition._target)
				end
			end

			transition._target = nil

		-- Normal case: update the transition at the current time, and put it into its
		-- (possibly earlier) position in the list.
		else
			UpdateTarget(transition, when)

			Transitions[index], index = transition, index + 1
		end
	end

	-- Trim off any now-vacant transition slots.
	-- To recycle: reset a property count ('n') to 0, and wipe 'onComplete' and 'transition'
	utils.TrimArray(Transitions, index)
end

-- Export the module.
return M