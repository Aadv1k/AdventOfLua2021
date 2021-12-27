local file = io.open('./sample.txt')
local content = file:read("a")
file:close()

local data={}
for item in content:gmatch('[^\n\r]+') do
    table.insert(data, item)
end

cols = {}
-- NEED TO KNOW THE LENGTH OF THE BINARIES
-- Created a nested table, each containing the respective "columns" of the binaries
for count=1,12,1 do
    currentCol = {}
    for _,currentBinary in pairs(data) do 
        table.insert(currentCol, currentBinary:sub(count, count))
    end
    cols[#cols+1] = currentCol
end

result = {
    gamma = '',
    epsilion = '',
}

for count=1,#cols,1 do 
    zero, one = 0, 0
    for _,num in pairs(cols[count]) do 
        if tonumber(num) == 0 then zero = zero + 1 else one = one + 1 end
    end
    
    if  zero > one then
        result['gamma'] = result['gamma']..'0'
        result['epsilion'] = result['epsilion']..'1'
    else
        result['gamma'] = result['gamma']..'1'
        result['epsilion'] = result['epsilion']..'0'
    end
end

print('Gamma: '..result['gamma']..'\n'..'Epsilion: '..result['epsilion'])
print('Gamma * Epsilion: '..tonumber(result['gamma'], 2) * tonumber(result['epsilion'], 2))
