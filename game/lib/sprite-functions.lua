-- keep files at powers of 2
-- keep files at 2048 pixels max for maximum compatibility

local frames = {}
local activeFrame
local currentFrame = 1

local spriteWidth, spriteHeight, spriteSheet

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
	}

	for __, info in ipairs(frameInfo) do
		frames[info[1]] = love.graphics.newQuad(info[2], info[3], spriteWidth, spriteHeight, spritesheetWidth, spritesheetHeight)
	end

	activeFrame = frames[currentFrame]
end

function drawSprite()
	love.graphics.draw(chopper, frames[currentFrame])
end

function updateSprite(dt)
	currentFrame = currentFrame + 1
	if currentFrame > #frames then
		currentFrame = 1
	end
	activeFrame = frames[currentFrame]
end
