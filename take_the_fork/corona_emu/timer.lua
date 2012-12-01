--- This module emulates some of Corona's timer module.

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
local system = require("corona_emu.system")
local utils = require("corona_emu.utils")

-- Exports --
local M = {}

-- Just-fired timers --
local PendingTimers = {}

---
function M.cancel (handle)
	handle._cancel = true
end

---
function M.pause (handle)
	handle._paused = true
end

---
function M.performWithDelay (delay, func, reps)
	local timer = { delay = delay, func = func, reps = reps ~= 0 and (reps or 1), time = system.getTimer() }

	PendingTimers[#PendingTimers + 1] = timer

	return timer
end

---
function M.resume (handle)
	handle._paused = false
end

-- Active timers --
local Timers = {}

--- DOCME
function M.Update (dt)
	-- Merge in pending timers.
	utils.MoveTo(Timers, PendingTimers)

	-- If the timer is still good at the start of this frame, put it into its (possibly
	-- earlier) position in the list; otherwise, let its membership lapse. If the timer
	-- is not paused, let it timeout as many times as it can (given available time lapse
	-- and number of repetitions allowed).
	local index, now = 1, system.getTimer()

	for _, timer in ipairs(Timers) do
		local reps = timer.reps

		if not timer._cancel and reps ~= 0 then
			if not timer._paused then
				local count, delay, func, time = timer.count or 0, timer.delay, timer.func, timer.time
				local delta = now - time

				while delta >= delay and reps ~= 0 do
					count, delta, time = count + 1, delta - delay, time + delay

					func{ name = "timer", count = count, source = timer, time = time } -- TODO: Recycle? With coroutines not really available, maybe reasonable...

					reps = reps and reps - 1
				end

				timer.count, timer.reps, timer.time = count, reps, time
			end

			Timers[index], index = timer, index + 1
		end
	end

	-- Trim off any vacant timer slots.
	-- To recycle: wipe 'func'
	utils.TrimArray(Timers, index)
end

-- Export the module.
return M