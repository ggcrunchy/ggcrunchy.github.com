--- Common Corona emulation utilities.

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

-- Exports --
local M = {}

--- DOCME
-- @ptable to
-- @ptable from
function M.CopyTo (to, from)
	for k, v in pairs(from) do
		to[k] = v
	end
end

--- DOCME
-- @ptable t
-- @param item
-- @treturn int I
function M.Find (t, item)
	for i, v in ipairs(t) do
		if rawequal(item, v) then
			return i
		end
	end
end

-- --
local Stage

--- DOCME
function M.GetStage ()
	return Stage
end

--- DOCME
-- @ptable to
-- @ptable from
function M.MoveTo (to, from)
	for i = 1, #from do
		to[#to + 1] = from[i]
	end

	M.TrimArray(from, 1)
end

--- DOCME
-- @ptable methods
-- @ptable properties
-- @treturn table X
function M.NewMetatable (methods, properties)
	local mt, meths = {}

	if properties then
		meths = {}

		function mt.__index (t, k)
			local method = meths[k]

			return method or (properties[k] or rawget)(t, k)
		end

		function mt.__newindex (t, k, v)
			(properties[k] or rawset)(t, k, v)
		end
	else
		mt.__index = mt
	end

	if methods then
		M.CopyTo(meths or mt, methods)
	end

	return mt
end

--- DOCME
-- @ptable t
-- @ptable keys
function M.RemoveKeys (t, keys)
	for _, k in ipairs(keys) do
		t[k] = nil
	end
end

--- DOCME
-- @pgroup stage
function M.SetStage (stage)
	Stage = stage
end

--- DOCME
-- @ptable arr
-- @uint from
function M.TrimArray (arr, from)
	for i = #arr, from, -1 do
		arr[i] = nil
	end
end

-- Export the module.
return M