local file = io.open('./input.txt', 'r')
local content = file:read('a')
file.close(file)
local lines = {}
for s in content:gmatch("[^\r\n]+") do
    table.insert(lines, s)
end

local pos = {
    horizontal = 0,
    depth = 0
}

for _, line in pairs(lines) do
   if line:find('forward') then
        pos['horizontal'] = pos['horizontal'] + tonumber(line:sub(line:find(' '), #line))
    elseif line:find('down') then 
        pos['depth'] = pos['depth'] + tonumber(line:sub(line:find(' '), #line))
    elseif line:find('up') then 
        pos['depth'] = pos['depth'] - tonumber(line:sub(line:find(' '), #line))
   end
end

print('Horizontal: '..pos['horizontal']..'\n'..'Depth: '..pos['depth'])
print(pos['depth']*pos['horizontal'])
