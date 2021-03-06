local file = assert(io.open('./input.txt', 'r'))
local content = file:read("*all")
file:close()

local data = {}
for i in string.gmatch(content, '%S+') do
    table.insert(data, tonumber(i))
end


-- Create a table with the 3-pair sums
sums = {}
for count=3,#data,1 do
    local currentSum = data[count] + data[count-1] + data[count-2]
    table.insert(sums, currentSum)
end

-- Just compare the element, with the element before it to get the result
local result = 0
for count=2,#sums,1 do
    if sums[count] > sums[count-1] then
        result = result + 1
    end
end

print(result)
print(result)
