local file = io.open('./sample.txt')
local contents = file:read("a")
file:close()

local block = {}
for lines in contents:gmatch('[^\r\n]+') do
    local row = {}
    for count=1,#lines do
        table.insert(row, tonumber(lines:sub(count, count)))
    end
    table.insert(block, row)
end

function table.indexOf(tab, elem)
    for i,v in pairs(tab) do
        if v == elem then
            return i
        end
    end
    
    return nil
end

function tillNine(block, row, column) 
    -- returns the index of elements to the right and left of the given column
    -- in the given row until 9

    local scope = block[row]
    local elems = {}

    for li=table.indexOf(scope, scope[column]),1,-1 do
        if scope[li] ~= nil then
            if scope[li] < 9 then
                table.insert(elems, li)
            else
                break 
            end
        end
    end

    for ri=table.indexOf(scope, scope[column]),#scope,1 do
        if scope[ri] ~= nil then
            if scope[ri] < 9 then
                table.insert(elems, ri)
            else
                break 
            end
        end
    end

    local result = {}
    for _,v in pairs(elems) do
        if table.indexOf(result, v) == nil then
            table.insert(result, v)
        end
    end
    return result
end

function verTillNine(block, row, column)
    local scope = block
    local elems = {}

    for upi=row,1,-1 do
        if scope[upi] ~= nil then
            if scope[upi][column] < 9 then
                table.insert(elems, upi)
            else
                break 
            end
        end
    end

    for di=row,#block do
        if scope[di] ~= nil then
            if scope[di][column] < 9 then
                table.insert(elems, di)
            else
                break 
            end
        end
    end

    local result = {}
    for _,v in pairs(elems) do
        if table.indexOf(result, v) == nil then
            table.insert(result, v)
        end
    end
    return result
end

function table.print(tab)
    for _,v in pairs(tab) do
        print(v)
    end
end

local function findNeighbours(block, rc, cc)
    local neighbours = {
        up = block[rc-1] and block[rc-1][cc] or nil,
        down = block[rc+1] and block[rc+1][cc] or nil,
        right = block[rc][cc+1] and block[rc][cc+1] or nil,
        left = block[rc][cc-1] and block[rc][cc-1] or nil,
        current = block[rc][cc]
    }
    return neighbours
end

local result = {}
for rc=1,#block do
    for cc=1,#block[rc] do
        if block[rc][cc] < 9 then

            local pos = findNeighbours(block, rc, cc)

            local currentcluster = {}
            for _,v in pairs(pos) do
                table.insert(currentcluster, v)
            end

            local basin = {}
            if math.min(table.unpack(currentcluster)) == block[rc][cc] then
                print(table.indexOf(block[rc], block[rc][cc]))
            end

        end
    end
end


