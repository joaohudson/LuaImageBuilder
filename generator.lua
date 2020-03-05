--write image in ppm format
function writeImage(image, fileName)
	local file = io.open(fileName .. ".ppm", "w")
	local space = nil
	file:write("P3\n" .. image.width .. " " .. image.height .. "\n255")
	
	for j = 1, image.width do
		file:write("\n")
		for i = 1, image.height do
			space = i == image.height and "" or " "
			file:write((image.data[(i - 1) * image.width + j].red) .. " " .. (image.data[(i - 1) * image.width + j].green) .. " " .. (image.data[(i - 1) * image.width + j].blue) .. space)
		end
	end
	
	file:close()
end
--make image with call function 
function makeImage(width, height, call)
	local image = {}
	local x, y = nil, nil
	image.width = width
	image.height = height
	image.data = {}
	
	for i = 1, width * height do
		x = (i % width == 0) and width or i % width
		y = math.floor(i / width) + 1
		
		x = x / width
		y = y / width
		
		image.data[i] = call(x, y, height / width)
	end
	
	return image
end
--create new color for r,g,b normalized[0,1]
function newColor(r, g, b)
	r = math.floor(r * 255)
	g = math.floor(g * 255)
	b = math.floor(b * 255)
	
	r = math.min(math.max(r, 0), 255)
	g = math.min(math.max(g, 0), 255)
	b = math.min(math.max(b, 0), 255)

	return {red = r, green = g, blue = b}
end
--invoke for all pixels to generate image
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
--create image
image = makeImage(1024, 1024, imageBuilder)
--write image
writeImage(image, "out")