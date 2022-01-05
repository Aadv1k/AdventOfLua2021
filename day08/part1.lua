local file = io.open('./input.txt')
local content = file:read('all')
file:close()

local lines = {}
for line in content:gmatch('[^\r\n]+') do
    local cr = line:sub(line:find('|')+2, #line)
    table.insert(lines, cr)
end

-- 1 4 7 8
-- in 8 all (7) letters appear atleast once
-- in 7 acf (3) appear once
-- in 4 bcdf (4) appear once
-- In 1 cf (2) appear once

local check = {
    [2] = 1,
    [4] = 4,
    [3] = 7,
    [7] = 8
}


local count = 0
for _,line in pairs(lines) do
    for word in line:gmatch('%S+') do
        if check[#word] ~= nil then
            count = count + 1
        end
    end
end

print(count)
