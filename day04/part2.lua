local file = io.open('./input.txt')
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
-- lua's "natural" indexes :/
-- 500 rows
-- 1
-- 1 + 5 = 6 
-- 1 + 4 = 5

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

function simBingo(draws, blocks)
	for _,draw in pairs(draws) do
		if draw['drawn'] ~= true then
			for _,block in pairs(blocks) do
				for count=1,5 do
					if checkRow(block, count) then
						-- This step is done the previous draw was the
						-- "correct" one, but as we check it in the next
						-- iteration, we get the wrong one, which is why we
						-- need to use the previous one

						currentDraw = nil
						for index,val in pairs(draws) do
							if val == draw then
								currentDraw = index
							end
						end

						return 	{
							type = 'r',
							index = count,
							block = block,
							draw = draws[currentDraw-1]['val']
						}
					elseif checkCol(block, count) then
						-- This step is done the previous draw was the
						-- "correct" one, but as we check it in the next
						-- iteration, we get the wrong one, which is why we
						-- need to use the previous one
						currentDraw = nil
						for index,val in pairs(draws) do
							if val == draw then
								currentDraw = index
							end
						end
						return 	{
							type = 'c',
							index = count,
							block = block,
							draw = draws[currentDraw-1]['val']
						}

					end
				end
				
				for _,row in pairs(block) do
					for _,num in pairs(row) do
						if num['marked'] ~= true and num['val'] == draw['val'] then
							num['marked'] = true
						end
					end
				end
				
			end
		end
	end
end

t = simBingo(draws, blocks) 
sum = 0
for _,row in pairs(t['block']) do
	for _,num in pairs(row) do
		if num['marked'] == false then
			sum = sum + num['val']
		end
	end
end

print('Sum: '..sum, 'Draw: '..t['draw'])
print('Score: '..sum*t['draw'])



