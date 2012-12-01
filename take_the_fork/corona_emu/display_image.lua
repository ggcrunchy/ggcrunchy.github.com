--- This module emulates some of Corona's image object logic.

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
local ImageMT

-- --
local ImageProperties = {}

--- DOCME
function M.New (parent, filename, x, y)
	if type(parent) ~= "table" or not parent._id then
		parent, filename, x, y = utils.GetStage(), parent, filename, x
	end

	local image = setmetatable(display_object.NewObject(ImageProperties), ImageMT)

	if type(filename) == "string" then
		image._graphic = lg.newImage(filename)
	else
		image._sheet = filename
		image._frame = x
	end

	image.xOrigin, image.yOrigin = (x or 0) - image.width / 2, (y or 0) - image.height / 2

	parent:insert(image)

	return image
end

-- --
local ImageMethods = {}

display_object.Populate(ImageMethods, ImageProperties)

--
local function GetQuad (image)
	return image._sheet:GetQuad(image._frame)
end

--
function ImageMethods:OnDraw (x, y, w, h, alpha)
	local ROTATE = 0 -- rad(angle)
	local XS, YS = (self._wscale or 1) * self.xScale, (self._hscale or 1) * self.yScale

-- tinting...
	local graphic = self._graphic

	if graphic then
		lg.draw(self._graphic, x, y,--[[ Correct if offset?]] ROTATE, XS, YS, self.width / 2, self.height / 2)
	else
		local quad, sx, sy = GetQuad(self)

		lg.drawq(self._sheet:GetGraphic(), quad, x + sx, y + sy)
	end
end

-- --
local Keys = { "_frame", "_graphic", "_hscale", "_sheet", "_wscale" }

--
function ImageMethods:OnRemove ()
	utils.RemoveKeys(self, Keys)
end

--
function ImageProperties:height (_, v)
	local graphic, h = self._graphic

	if graphic then
		h = graphic:getHeight()
	else
		local _, _, _, H = GetQuad(self):getViewport()

		h = H
	end

	if v == nil then
		return h * (self._hscale or 1)
	else
		self._hscale = v / h
	end
end

--
function ImageProperties:width (_, v)
	local graphic, w = self._graphic

	if graphic then
		w = graphic:getWidth()
	else
		local _, _, W, _ = GetQuad(self):getViewport()

		w = W
	end

	if v == nil then
		return w * (self._wscale or 1)
	else
		self._wscale = v / w
	end
end

ImageMT = utils.NewMetatable(ImageMethods, ImageProperties)

-- Export the module.
return M