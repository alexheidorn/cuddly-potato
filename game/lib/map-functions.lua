local tileWidth, tileHeight, tileset, quads, timeTable

function loadMap(path)
	love.filesystem.load(path)()	
end

function newMap(tileW, tileH, tilesetPath, tileString, quadInfo)
	tileset = love.graphics.newImage(tilesetPath)
	tileWidth, tileHeight = tileW, tileH
	tilesetWidth, tilesetHeight = tileset:getWidth(), tileset:getHeight()

	quads = {}

	for __, info in ipairs(quadInfo) do
		-- info[1] = the character, info[2] = x, info[3] = y

		quads[info[1]] = love.graphics.newQuad(info[2], info[3], tileWidth, tileHeight, tilesetWidth, tilesetHeight)
	end

	tileTable = {}

	local mapWidth = #(tileString:match("[^\n]+")) -- number of columns

	for line in tileString:gmatch("[^\n]+") do
		for char in line:gmatch(".") do
			tileTable
end

function drawMap(map)
	for rowInex = 1, #TileTable do
		local row = TileTable[rowInex]

		for colIndex = 1, #row do
			local char = row[colIndex]
			local x, y = (colIndex - 1) * tileWidth, (rowInex - 1) * tileHeight

			love.graphics.draw(tileset, quads[char], x, y)
		end
	end
end
