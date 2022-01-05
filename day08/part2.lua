file = io.open('./input.txt')
local content = file:read('all')
file:close()

lines = {}
for line in content:gmatch('[^\r\n]+') do
    right = line:sub(line:find('|')+2, #line)
    left = line:sub(1, line:find('|')-2)
    table.insert(lines, {left, right})
end

function table.sum(t)
	result = 0
	for _,v in pairs(t) do
		result = result + v
	end
	return result
end

function string.sort(s)
    local result = {}
    for count=1,#s do
        table.insert(result, string.sub(s, count, count))
    end
    table.sort(result)
    return table.concat(result, '')
end

function findOverlaps(left, right)
    local overlaps = {}
    for count=1,#right do
        if left:find(right:sub(count, count)) ~= nil then
            table.insert(overlaps, right:sub(count, count))
            -- its is a overlap
        else
            -- it is not a overlap
        end
    end
    return #overlaps
end

matches = {
    [7] = 8,
    [2] = 1,
    [3] = 7,
    [4] = 4
}



local outputVals = {}
for _,line in pairs(lines) do
    ref = {}
    numStr = ''
    -- we create a ref with numbers we know
    for lWrd in line[1]:gmatch('%S+') do
        if matches[#lWrd] then
            ref[#lWrd] = lWrd:sort()
        end
    end

    for rWrd in line[2]:gmatch('%S+') do
        if matches[#rWrd] then
            numStr = numStr..tostring(matches[#rWrd])
        else
            -- this is where we douse some coconut oil
            if #rWrd == 6 then
                -- the length is 6
                if findOverlaps(ref[2], rWrd) == 1 then
                    -- we can be sure its 6
                    numStr = numStr..tostring(6)
                elseif findOverlaps(ref[4], rWrd) == 3 then
                    -- we can be sure its 4
                    numStr = numStr..tostring(0)
                elseif findOverlaps(ref[7], rWrd) == 6 and findOverlaps(ref[3], rWrd) == 3 then
                    -- we can say its 9
                    numStr = numStr..tostring(9)
                end
            else
                -- the length is 5
                if findOverlaps(ref[2], rWrd) == 2 and findOverlaps(ref[7], rWrd) == 5 then
                    -- it is 3
                    numStr = numStr..tostring(3)
                elseif findOverlaps(ref[4], rWrd) == 2 then
                    -- its 2
                    numStr = numStr..tostring(2)
                elseif findOverlaps(ref[4], rWrd) == 3 then
                    numStr = numStr..tostring(5)
                    -- its 5
                end
            end
        end
    end
    table.insert(outputVals, tonumber(numStr))
end


print(table.sum(outputVals))



