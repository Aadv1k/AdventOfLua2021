local file = io.open('./sample.txt')
local rawDraws = file:read()
local rawContent = file:read('a')
file:close()

draws = {}
for nums in rawDraws:gmatch('%d+') do
	currentD = {
		val = tonumber(nums),
		drawn = false
	}
	table.insert(draws, currentD)
end

boards = {}
for board in rawContent:gmatch('[^\n\r]+') do
	table.insert(boards, board)
end

rows = {}
for _,vals in pairs(boards) do
	currentRow = {}
	for val in vals:gmatch('%d+') do
		rowDat = {
			val = tonumber(val),
			marked = false,
		}		
		table.insert(currentRow, rowDat)
	end
	table.insert(rows, currentRow)
end

blocks = {}
for count=1,#rows,5 do
	currentBlock = {}
	for c=count,count+4 do
		table.insert(currentBlock, rows[c])	
	end
	table.insert(blocks, currentBlock)
end

function checkCol(block, pos)
	trues = {}
	for _,rows in pairs(block) do
		table.insert(trues, rows[pos]['marked'])
	end
	for _,t in pairs(trues) do
		if t == false then
			return false
		end
	end
	return true
end

function checkRow(block, pos)
	trues = {}
	for _,num in pairs(block[pos]) do
		table.insert(trues, num['marked'])
	end
	for _,t in pairs(trues) do
		if t == false then
			return false
		end
	end
	return true
end

t = simBingo(draws, blocks) 
print(t)

--[[
b = t['block']
print(t['t'])

print(t['draw']['val'])

sum = 0
for _,row in pairs(b) do
	for _,num in pairs(row) do
		print(num['val'])
	end
end

print('Sum: '..sum, 'Draw: '..t['draw'])
print('Score: '..sum*t['draw'])
]]
