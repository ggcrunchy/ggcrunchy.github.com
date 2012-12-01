--- This module emulates some of Corona's graphics module.

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
local utils = require("corona_emu.utils")

-- Exports --
local M = {}

-- Love globals --
local lg = love.graphics

--
local function AddFrame (sheet, frame, w, h)
	sheet[#sheet + 1] = lg.newQuad(frame.x, frame.y, frame.width, frame.height, w, h)
	sheet[#sheet + 1] = frame.sourceX or 0
	sheet[#sheet + 1] = frame.sourceY or 0
end

-- --
local SheetMT

--- DOCME
function M.newImageSheet (filename, options)
	local frames, graphic = #options > 0 and options or options.frames, lg.newImage(filename)
	local sheet, w, h = setmetatable({ _graphic = graphic }, SheetMT), graphic:getWidth(), graphic:getHeight()

	if frames then
		for _, frame in ipairs(frames) do
			AddFrame(sheet, frame, w, h)
		end

	else
		-- TODO?
		-- Frame.x, Frame.y = ...
		-- NewFrame(sheet, Frame)
	end

	return sheet
end

-- --
local SheetMethods = {}

--
function SheetMethods:GetGraphic ()
	return self._graphic
end

--
function SheetMethods:GetQuad (index)
	index = index * 3 - 2

	return self[index], self[index + 1], self[index + 2]
end

--
SheetMT = utils.NewMetatable(SheetMethods)

-- Export the module.
return M