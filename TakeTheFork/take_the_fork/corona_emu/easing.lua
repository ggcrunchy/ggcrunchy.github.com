--- This module emulates Corona's easing module. Adapated from [Corona Transitions](https://github.com/abueldahab/Corona-Transitions)

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
local pow = math.pow

-- Exports --
local M = {}

--- Easing equation function for an exponential (2^t) easing in: accelerating from zero velocity.
function M.inExpo (t, d, b, c)
	t = t / d

	if t == 0 then
		return 0
	else
		t = pow(2, 10 * (t - 1))

		return t * c + b
	end  
end

-- TODO? inOutExpo, inOutQuad

--- Easing equation function for a quadratic (t^2) easing in: accelerating from zero velocity.
function M.inQuad (t, d, b, c)
	t = t / d -- 0..1
	t = t * t

	return t * c + b
end


--- No easing: linear
function M.linear (t, duration, start, delta)
	return start + t * delta / duration
end

--- Easing equation function for an exponential (2^t) easing out: decelerating from zero velocity.
function M.outExpo (t, d, b, c)
	t = t / d
	t = 1 - 1.001 * pow(2, -10 * t)

	return t * c + b   
end


--- Easing equation function for a quadratic (t^2) easing out: decelerating to zero velocity.
function M.outQuad (t, d, b, c)
	t = t / d -- 0..1
	t = -t * (t - 2)

	return t * c + b
end

-- Export the module.
return M