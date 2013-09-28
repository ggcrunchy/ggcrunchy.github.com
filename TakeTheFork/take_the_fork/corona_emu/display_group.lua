--- This module emulates some of Corona's display group logic.

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
local display_object = require("corona_emu.display_object")
local utils = require("corona_emu.utils")

-- Exports --
local M = {}

-- --
local Groups, Free = {}, false

--- DOCME
function M.FindGroup (id)
	return Groups[id]
end

-- --
local GroupMT

--
local function SetParent (object, group)
	object._parent = group._id
end

--- DOCME
function M.New ()
	local group, id = display_object.NewObject()

	-- By default, add the new group to the stage (if missing, this group IS the stage).
	local stage = utils.GetStage()

	if stage then
		stage[#stage + 1] = group

		SetParent(group, stage)
	end

	-- Add the group to a free slot for lookup.
	if Free then
		id, Free = Free, Groups[Free]
	else
		id = #Groups + 1
	end

	group._id, Groups[id] = id, group

	return setmetatable(group, GroupMT)
end

-- --
local GroupMethods, GroupProperties = {}, {}

display_object.Populate(GroupMethods, GroupProperties)

--
function GroupMethods:insert (index, object)
	if object == nil then
		object, index = index
	end

	--
	local from = object.parent

	if from then
		local slot = utils.Find(from, object)

		if rawequal(from, self) then
			if index == slot then
				return
			elseif index > slot then
				index = index - 1
			end
		end

		remove(from, slot)
	end

	--
	SetParent(object, self)

	--
	if index then
		insert(self, index, object)
	else
		insert(self, object)
	end
end

--
function GroupMethods:OnDraw (x, y, w, h, alpha)
	-- rotation, scale, xref, yref?

	for _, item in ipairs(self) do
		if item.isVisible then
			item:OnDraw(x + item.xOrigin, y + item.yOrigin, w, h, alpha * self.alpha)
		end
	end
end

--
function GroupMethods:OnRemove ()
	local id = self._id

	for i = #self, 1, -1 do
		remove(group, i):removeSelf()
	end

	Groups[id], Free, self._id = Free, id
end

--
function GroupProperties:height (_, v)
	if v == nil then
		-- get child heights...
	else
		-- ??
	end
end

--
function GroupProperties:numChildren (_, v)
	if v == nil then
		return #self
	end
end

--
function GroupProperties:width (_, v)
	if v == nil then
		-- get child widths...
	else
		-- ??
	end
end

--
GroupMT = utils.NewMetatable(GroupMethods, GroupProperties)

-- Export the module.
return M