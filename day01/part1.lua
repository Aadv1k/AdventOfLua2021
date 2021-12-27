local file = assert(io.open('./input.txt', 'r'))
local content = file:read("*all")
file:close()

local data = {}
for i in string.gmatch(content, '%S+') do
    table.insert(data, tonumber(i))
end

local result = 0
for count=2,#data,1 do
    if data[count] >= data[count-1] then
        result = result + 1
    end
end

print(result)