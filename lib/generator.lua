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
		y = y / height
		
		image.data[i] = call(x, y, height / width)
	end
	
	return image
end

local imageBuilder = require "main"

--create image
image = makeImage(arg[1], arg[2], imageBuilder)
--write image
writeImage(image, "out")