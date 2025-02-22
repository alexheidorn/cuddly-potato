function love.load()
end

function love.update()
	print("Hello!")
end

function love.draw()
	love.graphics.print("Hello world!", 100, 100)
	love.graphics.line(0, 0, 400, 400)
end

function love.quit()
	print("Goodbye!")
end
