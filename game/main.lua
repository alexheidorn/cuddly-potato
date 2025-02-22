function love.load()
	love.graphics.setBackgroundColor(255, 255, 255, 255)
end

function love.update()
	print("Hello!")
end

function love.draw()
	love.graphics.setColor(255, 0, 0, 128)
	love.graphics.print("Hello world!", 100, 100)
	love.graphics.line(0, 0, 400, 400)

	love.graphics.setColor(0, 0, 255, 255)
	love.graphics.line(0,  love.graphics.getHeight()/2, love.graphics.getWidth(), love.graphics.getHeight()/2)
end

function love.quit()
	print("Goodbye!")
end
