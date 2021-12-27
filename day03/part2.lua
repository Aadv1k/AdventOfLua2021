local file = io.open('./input.txt')
local content = file:read("a")
file:close()

local data={}
for item in content:gmatch('[^\n\r]+') do
    table.insert(data, item)
end

function getNofBin(data, pos)
	current = ''

    for _,v in pairs(data) do
		current = current..v:sub(pos, pos)
    end

	-- OK SO THIS WAS NOT THE CULPRIT	
	_,oneCount = current:gsub('1', '')
	_,zeroCount = current:gsub('0', '')


	if oneCount > zeroCount then 
		greater = 1
	elseif zeroCount > oneCount then 
		greater = 0
	elseif zeroCount == oneCount then 
		greater = nil
	end

	 result = {
		zero = zeroCount,
		one = oneCount,
		greater = greater
	 }

	return result
end

oxyData = data

function getOxyData(oxyData)
	for count=1,13,1 do
		currentCol = {}
		greater = getNofBin(oxyData, count)['greater']

		if greater == nil then
			for i,v in pairs(oxyData) do 
				if v:sub(count, count) == '1' then
					return v
				end
			end
			break

		else 
			for _,item in pairs(oxyData) do
				if item:sub(count, count) == tostring(greater) then
					table.insert(currentCol, item)	
				end
			end
		end
		oxyData = currentCol
	end
end


function getCo2Data(oxyData)
	for count=1,13,1 do
		currentCol = {}
		greater = getNofBin(oxyData, count)['greater']
		if greater == 1 then
			greater = 0
		elseif greater == 0 then
			greater = 1
		end

		if greater == nil then
			for i,v in pairs(oxyData) do 
				if v:sub(count, count) == '0' then
					return v
				end
			end
			break

		else 
			for _,item in pairs(oxyData) do
				if item:sub(count, count) == tostring(greater) then
					table.insert(currentCol, item)	
				end
			end
		end
		oxyData = currentCol
	end
end


od = tonumber(getOxyData(data), 2)
cd = tonumber(getCo2Data(data), 2)

print('Oxygen generator rating: '..od..'\n'..'Co2 scrubber rating: '..cd)
print('o2 rating * co2 rating: '..cd*od)


-- Debug
-- for i,v in pairs(that) do print(i..':'..' '..v) end
