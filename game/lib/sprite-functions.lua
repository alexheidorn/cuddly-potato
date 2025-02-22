-- keep files at powers of 2
-- keep files at 2048 pixels max for maximum compatibility

local frames = {}
local activeFrame
local currentFrame = 1

local spriteWidth, spriteHeight, spriteSheet
local rotation = math.rad(90)
local x, y = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2

function createSprite()
	-- sprite = love.graphics.newImage("assets/sprites/character.png")
	chopper = love.graphics.newImage("assets/pictureAttackChoppers_thumb.png")
	local spritesheetWidth, spritesheetHeight = chopper:getWidth(), chopper:getHeight()
	spriteWidth, spriteHeight = 128, 64
	frameInfo = {
		{ 1, 0, 0 },
		{ 2, 128, 0 },
		{ 3, 0, 64 },		
		{ 4, 128, 64 },
		{ 5, 0, 128 },
		{ 6, 128, 128 },

	}

	for __, info in ipairs(frameInfo) do
		frames[info[1]] = love.graphics.newQuad(info[2], info[3], spriteWidth, spriteHeight, spritesheetWidth, spritesheetHeight)
	end

	activeFrame = frames[currentFrame]
end

function drawSprite()
	local scaleX, scaleY = 1, 1
	local originX, originY = spriteWidth / 2, spriteHeight / 2
	love.graphics.draw(chopper, activeFrame, x, y, rotation, scaleX, scaleY, originX, originY)
end

local elapsedTime = 0
function updateSprite(dt)
	elapsedTime = elapsedTime + dt
	
	if elapsedTime > 0.1 then
		currentFrame = currentFrame + 1
		if currentFrame > #frames then
			currentFrame = 1
		end
		activeFrame = frames[currentFrame]
		elapsedTime = 0
	end 
	if elapsedTime > 1/ 60 then -- rotate every frame
		rotation = rotation + math.rad(5)
	end

	-- polling-based keyboard input
	if love.keyboard.isDown("a") then
		x = x - 100 * dt
	end

	if love.keyboard.isDown("d") then
		x = x + 100 * dt
	end

	if love.keyboard.isDown("w") then
		y = y - 100 * dt
	end

	if love.keyboard.isDown("s") then
		y = y + 100 * dt
	end
end
