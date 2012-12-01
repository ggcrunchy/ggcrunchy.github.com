--- This module emulates some of Corona's display object logic.

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
local insert = table.insert
local remove = table.remove

-- Modules --
local event_listener = require("corona_emu.event_listener")
local utils = require("corona_emu.utils")

-- Exports --
local M = {}

-- Deferred modules
local display_group

--- DOCME
function M.NewObject (props)
	local object = { alpha = 1, _isVisible = true, rotation = 0, strokeWidth = 1, xOrigin = 0, yOrigin = 0, xReference = 0, yReference = 0, xScale = 1, yScale = 1 }

	if props then
		for k in pairs(props) do
			object[k] = nil
		end
	end

	return object
end

-- Methods common to all Display Objects --
local ObjectMethods = {}

event_listener.Populate(ObjectMethods)

--
function ObjectMethods:contentToLocal (x, y)
	-- TODO?
end

--
function ObjectMethods:localToContent (x, y)
	repeat
		x, y = x + self.x, y + self.y

		self = self.parent
	until not self

	return x, y -- rotation, etc.
end

-- Possible display properties --
local DisplayProperties = {
	"alpha", "rotation", "strokeWidth", "xScale", "yScale",
	"contentHeight", "contentWidth",
	"height", "width",
	"xOrigin", "yOrigin", "xReference", "yReference",
	"_isVisible", "_listeners", "_parent"
}

--
function ObjectMethods:removeSelf ()
	-- Remove the object from its group (with a recursion guard).
	local group = self.parent

	if group then
		remove(group, utils.Find(group, self))
	end

	-- Do any on-remove logic.
	local on_remove = self.OnRemove

	if on_remove then
		on_remove(self)
	end

	-- Remove display properties.
	setmetatable(self, nil)

	utils.RemoveKeys(self, DisplayProperties)
end

--
local function GetColor (r, g, b, a)
	if b == nil then
		g, b, a = r, r, g
	end

	return r, g, b, a or 255
end

--
function ObjectMethods:setFillColor (r, g, b, a)
	r, g, b, a = GetColor(r, g, b, a)

	-- and...?
end

--
function ObjectMethods:setStrokeColor (r, g, b, a)
	r, g, b, a = GetColor(r, g, b, a)

	-- ?
end

--
function ObjectMethods:toBack ()
	local group = self.parent
	local slot = utils.Find(group, self)

	if slot ~= #group then
		remove(group, slot)
		insert(group, self)
	end
end

--
function ObjectMethods:toFront ()
	local group = self.parent
	local slot = utils.Find(group, self)

	if slot ~= 1 then
		remove(group, slot)
		insert(group, 1, self)
	end
end

-- --
local ObjectProperties = {}

--
function ObjectProperties:contentHeight (_, v)
	-- TODO?
end

--
function ObjectProperties:contentWidth (_, v)
	-- TODO?
end

--
function ObjectProperties:isVisible (_, v)
	if v == nil then
		return self._isVisible and self.alpha > 0
	else
		self._isVisible = not not v
	end
	-- TODO?
end

--
function ObjectProperties:parent (_, v)
	if v == nil then
		display_group = display_group or require("corona_emu.display_group")

		-- assert not stage?
		return display_group.FindGroup(self._parent)
	end
end

--
function ObjectProperties:x (_, v)
	if v then
		self.xOrigin = v -- -refernce...
	else
		return self.xOrigin -- + reference...
	end
end

--
function ObjectProperties:y (_, v)
	if v then
		self.yOrigin = v -- -refernce...
	else
		return self.yOrigin -- + reference...
	end
end

--- DOCME
function M.Populate (methods, properties)
	utils.CopyTo(methods, ObjectMethods)
	utils.CopyTo(properties, ObjectProperties)
end

-- Export the module.
return M