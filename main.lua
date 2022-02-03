require "lib/util"

-- x - is horizontal coordinate between 0 and 1
-- y - is vertical coordinate between 0 and 1
-- aspect - is height/width of the image
function imageBuilder(x, y, aspect)
	
	x = x - 0.5
	y = y - 0.5
	
	local r = math.sqrt(x * x + y * y)
	local teta = math.atan2(y, x)
	
	local l = 1 - math.sqrt(x * x + y * y) / math.sqrt(0.5)
	
	x = x + 0.5
	y = y + 0.5
	
	local red = x * x * x * 1.5
	local green = r * r * 4
	local blue = (1 - r) * (1 - r) * 1.5
	
	l = l * l * l
	local mask = (math.sin(teta * 16 + r * 64) * 0.5 + 0.5)
	
	return newColor(l * red * mask, l * green * mask, l * blue * mask)
end

return imageBuilder