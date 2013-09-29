--- This module emulates some of Corona's display module.

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
local display_circle = require("corona_emu.display_circle")
local display_image = require("corona_emu.display_image")
local display_object = require("corona_emu.display_object")
local display_group = require("corona_emu.display_group")
local display_rect = require("corona_emu.display_rect")
local display_sprite = require("corona_emu.display_sprite")
local utils = require("corona_emu.utils")

-- Exports --
local M = {}

--- DOCME
M.getCurrentStage = utils.GetStage

--- DOCME
M.newCircle = display_circle.New

--- DOCME
M.newGroup = display_group.New

--- DOCME
M.newImage = display_image.New

--- DOCME
M.newRect = display_rect.New

--- DOCME
M.newSprite = display_sprite.New

--- DOCME
function M.remove (object)
	if object and object.parent then
		object:removeSelf()
	end
end

--
utils.SetStage(M.newGroup())

--
M.contentWidth = love.graphics.getWidth()
M.contentHeight = love.graphics.getHeight()

-- Export the module.
return M