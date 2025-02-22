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
end

function love.quit()
	print("Goodbye!")
end
