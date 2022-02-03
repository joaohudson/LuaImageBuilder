print("Image name:")
io.flush()
local image = io.read() .. ".jpg"

print("Image width:")
io.flush()
local width = io.read()

print("Image height:")
io.flush()
local height = io.read()

print("Lua interpreter name:")
io.flush()
local interpreter = io.read()

os.execute(interpreter .. " lib/generator.lua " .. width .. " " .. height)
os.execute("java -jar lib/PPMConverter.jar out.ppm " .. image)
os.remove("out.ppm")