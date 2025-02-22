local tileWidth, tileHeight, tileset, quads, tileTable

function loadMap(path)
	love.filesystem.load(path)()	
end

function newMap(tileW, tileH, tilesetPath, tileString, quadInfo)
	tileset = love.graphics.newImage(tilesetPath)
	tileWidth, tileHeight = tileW, tileH
	local tilesetWidth, tilesetHeight = tileset:getWidth(), tileset:getHeight()

	quads = {}

	for __, info in ipairs(quadInfo) do
		-- info[1] = the character, info[2] = x, info[3] = y
		quads[info[1]] = love.graphics.newQuad(info[2], info[3], tileWidth, tileHeight, tilesetWidth, tilesetHeight)
	end

	tileTable = {}

	local mapWidth = tileString:match("[^\n]+"):len()

	for i = 1, mapWidth, 1 do
		tileTable[i] = {}
	end
	
	local rowIndex, columnIndex = 1, 1
	for line in tileString:gmatch("[^\n]+") do
		columnIndex = 1
		for char in line:gmatch(".") do
			tileTable[columnIndex][rowIndex] = char
			columnIndex = columnIndex + 1
		end
	rowIndex = rowIndex + 1
	end

end

function drawMap()
	for rowIndex = 1, #tileTable do
		local row = tileTable[rowInex]
		for colIndex = 1, #row do
			local char = row[colIndex]
			local x, y = (colIndex - 1) * tileWidth, (rowIndex - 1) * tileHeight
			love.graphics.draw(tileset, quads[char], x, y)
		end
	end
end
