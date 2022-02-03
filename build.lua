print("Image name:")
io.flush()
local image = io.read() .. ".jpg"

print("Lua interpreter name:")
io.flush()
local interpreter = io.read()

os.execute(interpreter .. " lib/generator.lua")
os.execute("java -jar lib/PPMConverter.jar out.ppm " .. image)
os.remove("out.ppm")