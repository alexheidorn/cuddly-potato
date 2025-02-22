require "lib/map-functions"
require "lib/sprite-functions"


function love.load()
	love.keyboard.setKeyRepeat(true)
	love.graphics.setBackgroundColor(255, 255, 255, 255)
	loadMap('/assets/maps/chez-peter.lua')
	createSprite()
end

local currentX = 0
function love.update(dt) -- updates as often as possible -- dt (delta time) time sinxe last frame
	print("Hello!")
	updateSprite(dt)
	if currentX < love.graphics.getWidth() then
		currentX = currentX + 100 * dt --dt normalizes the speed
	else
		currentX = 0
	end
end

local circleX, circleY = love.graphics.getWidth()/2, love.graphics.getHeight()/2

function love.draw()
	love.graphics.reset()
	drawMap()
	drawSprite()
	love.graphics.setColor(255, 0, 0, 128)
	love.graphics.print("Hello world!", 100, 100)
	love.graphics.line(0, 0, 400, 400)

	love.graphics.setColor(0, 0, 255, 255)
	love.graphics.line(0,  love.graphics.getHeight()/2, love.graphics.getWidth(), love.graphics.getHeight()/2)

	love.graphics.setColor(0, 255, 0, 2)
	love.graphics.polygon("fill",
		{currentX+0,100, currentX+200,100, 
			currentX+200,300, currentX+0,300}
	)	

	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.circle("fill", circleX, circleY, 50)
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	-- event-based keyboard input
	if key == "left" then
		circleX = circleX - 100
	end

	if key == "right" then
		circleX = circleX + 100
	end
	
end

function love.quit()
	print("Goodbye!")
end
