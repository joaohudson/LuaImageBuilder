print("Image name:")
name = io.read() .. ".jpg"

os.execute("lua generator.lua")
os.execute("java -jar PPMConverter.jar out.ppm " .. name)
os.execute("del out.ppm")