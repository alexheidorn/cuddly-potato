require "lib/map-functions"

function love.load()
	love.graphics.setBackgroundColor(255, 255, 255, 255)
	loadMap('/assets/maps/chez-peter.lua')
end

local currentX = 0
function love.update(dt) -- updates as often as possible -- dt (delta time) time sinxe last frame
	print("Hello!")
	if currentX < love.graphics.getWidth() then
		currentX = currentX + 100 * dt --dt normalizes the speed
	else
		currentX = 0
	end
end

function love.draw()
	love.graphics.reset()
	drawMap()
	love.graphics.setColor(255, 0, 0, 128)
	love.graphics.print("Hello world!", 100, 100)
	love.graphics.line(0, 0, 400, 400)

	love.graphics.setColor(0, 0, 255, 255)
	love.graphics.line(0,  love.graphics.getHeight()/2, love.graphics.getWidth(), love.graphics.getHeight()/2)

	love.graphics.setColor(0, 255, 0, 42)
	love.graphics.polygon("fill",
		{currentX+0,100, currentX+200,100, 
			currentX+200,300, currentX+0,300}
	)	
end

function love.quit()
	print("Goodbye!")
end
