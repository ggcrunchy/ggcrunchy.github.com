--- This module emulates some of Corona's rect object logic.

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
local RectMT

---
function M.New (parent, x, y, w, h)
	if h == nil then
		parent, name, x, y, w, h = utils.GetStage(), parent, x, y, w
	end

	local rect = setmetatable(display_object.NewObject(), RectMT)

	rect.xOrigin, rect.yOrigin = x - w / 2, y - h / 2
	rect.width, rect.height = w, h

	parent:insert(rect)

	return rect
end

-- --
local RectMethods, RectProperties = {}, {}

display_object.Populate(RectMethods, RectProperties)

--
function RectMethods:OnDraw (--[[args]])
	-- lg.draw(...)
end

RectMT = utils.NewMetatable(RectMethods, RectProperties)

-- Export the module.
return M