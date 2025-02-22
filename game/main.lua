function love.load()
	love.graphics.setBackgroundColor(255, 255, 255, 255)
end

function love.update()
	print("Hello!")
	if currentX < love.graphics.getWidth() then
		currentX = currentX + 1
	else
		currentX = 0
	end
end

currentX = 0
function love.draw()
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
