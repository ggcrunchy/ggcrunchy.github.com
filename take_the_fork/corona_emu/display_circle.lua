--- This module emulates some of Corona's circle object logic.

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
local display_object = require("corona_emu.display_object")
local utils = require("corona_emu.utils")

-- Corona globals --
local lg = love.graphics

-- Exports --
local M = {}

-- --
local CircleMT

---
function M.New (parent, x, y, radius)
	if h == nil then
		parent, name, x, y, radius = utils.GetStage(), parent, x, y
	end

	local circle = setmetatable(display_object.NewObject(), CircleMT)

	circle.xOrigin, circle.yOrigin = x - radius, y - radius
	circle._radius = radius

	parent:insert(circle)

	return circle
end

-- --
local CircleMethods, CircleProperties = {}, {}

display_object.Populate(CircleMethods, CircleProperties)

--
function CircleMethods:OnDraw (--[[args]])
	-- lg.draw(...)
end

--
function CircleMethods:OnRemove ()
	self._radius = nil
end

CircleMT = utils.NewMetatable(CircleMethods, CircleProperties)

-- Export the module.
return M