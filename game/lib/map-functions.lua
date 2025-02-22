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

	local mapWidth = #tileString:match("[^\n]+") -- number of columns in the map (width)

	for line in tileString:gmatch("[^\n]+") do -- iterate over each line in the map
		tileTable[#tileTable+1] = {} -- add a new row to the map table
		for char in line:gmatch(".") do -- iterate over each character in the line
			tileTable[#tileTable][#tileTable[#tileTable]+1] = char -- add the character to the row
		end
	end
end

function drawMap()
	for rowIndex = 1, #tileTable do
		local row = tileTable[rowIndex]
		for colIndex = 1, #row do
			local char = row[colIndex]
			local x, y = (colIndex - 1) * tileWidth, (rowIndex - 1) * tileHeight
			love.graphics.draw(tileset, quads[char], x, y)
		end
	end
end
