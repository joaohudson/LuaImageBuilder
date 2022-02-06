--create new color for r,g,b normalized[0,1]
local function newColor(r, g, b)
	r = math.floor(r * 255)
	g = math.floor(g * 255)
	b = math.floor(b * 255)
	
	r = math.min(math.max(r, 0), 255)
	g = math.min(math.max(g, 0), 255)
	b = math.min(math.max(b, 0), 255)

	return {red = r, green = g, blue = b}
end

return {
	newColor = newColor
}