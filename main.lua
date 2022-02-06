local util = require "lib/util"

-- x - is horizontal coordinate between 0 and 1
-- y - is vertical coordinate between 0 and 1
-- aspect - is height/width of the image
function imageBuilder(x, y, aspect)
	-- set origin in center screen
	x = x - 0.5
	y = y - 0.5
	-- 1 - radius = bigger glow in the center
	local l = 1 - math.sqrt(x*x + y*y)
	-- l*l*l... = exponent that amplifies the focus of light
	local r = l*l*l*l*l*l*l

	return util.newColor(r,r,r)
end

return imageBuilder