--- This module emulates some of Corona's event listenter logic.

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
local remove = table.remove

-- Modules --
local utils = require("corona_emu.utils")

-- Exports --
local M = {}

-- Event Listener methods --
local EventListener = {}

--
function EventListener:addEventListener (name, listener)
	local llist = self._listeners or {}
	local lfuncs = llist[name] or {}

	self._listeners, llist[name] = llist, lfuncs

	lfuncs[#lfuncs + 1] = listener or false
end

--
function EventListener:dispatchEvent (event)
	local llist, name = self._listeners, event.name
	local lfuncs = llist and llist[name] or ""
	local n = #lfuncs

	if n > 0 then
		lfuncs.index, lfuncs.n = 1, n

		while lfuncs.index <= lfuncs.n do
			local func = lfuncs[lfuncs.index]

			if func == false or type(func) == "table" then
				local t = func or self

				t[name](t, event)
			elseif func then
				func(event)
			end

			--
			lfuncs.index = lfuncs.index + 1
		end
	end
end

--
function EventListener:removeEventListener (name, listener)
	listener = listener or self

	local llist = self._listeners
	local lfuncs = llist and llist[name] or ""

	for i = #lfuncs, 1, -1 do
		if rawequal(lfuncs[i] or self, listener) then
			remove(lfuncs, i)

			local index = lfuncs.index

			if index and i <= index then
				lfuncs.index = index - 1
			end

			lfuncs.n = lfuncs.n - 1
		end
	end
end

--- DOCME
function M.Populate (t)
	utils.CopyTo(t, EventListener)
end

-- Export the module.
return M