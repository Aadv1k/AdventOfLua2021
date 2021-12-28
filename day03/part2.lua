local file = io.open('./sample.txt')
local content = file:read("a")
file:close()

local data={}
for item in content:gmatch('[^\n\r]+') do
    table.insert(data, item)
end

-- Returns the number of 0 or 1 at the given position in the data, also which is greater
function nOfBinary(data, position)
    local zeroCount, oneCount = 0, 0
    for _,binary in pairs(data) do
        if string.sub(binary, position, position) == '1' then
            oneCount = oneCount + 1
        elseif string.sub(binary, position, position) == '0' then
            zeroCount = zeroCount + 1
        end
    end

    if zeroCount > oneCount then 
        local greater = 0 
    elseif zeroCount < oneCount then 
        local greater = 1 
    else 
        local greater = nil
    end

    return {oneCount = oneCount, zeroCount = zeroCount, greater=greater}
end

function filterByGreaterTarget(data, position)
    local greater = nOfBinary(data, position)['greater']
    local filteredData = {}

    for _,letters in pairs(data) do
        if greater == nil then
            table.insert(filteredData, letters)
            return filteredData

        elseif string.sub(letters, position, position) == tostring(greater) then
            table.insert(filteredData, letters)
        end
    end

    return filteredData
end

function filterByLowerTarget(data, position)
    local target = nOfBinary(data, position)['greater']
    local filteredData = {}
    if target == nil then
        local greater = nil
    elseif target == 1 then
        local greater = 0
    elseif target == 0 then
        local greater = 1
    end

    for _,letters in pairs(data) do
        if greater == nil then
            table.insert(filteredData, letters)
            return filteredData

        elseif string.sub(letters, position, position) == tostring(greater) then
            table.insert(filteredData, letters)
        end
    end

    return filteredData
end


local result = {
    oxygenRating = nil,
    co2Rating = nil,
}

--[[
oxyData = data
for count=1,#data[1],1 do
    if nOfBinary(oxyData, count)['greater'] ~= nil then
        oxyData = filterByGreaterTarget(oxyData, count)
    else
       break
    end
end
--]]

co2Data = data
for count=1,#data[1],1 do
    if nOfBinary(co2Data, count)['greater'] ~= nil then
        co2Data = filterByLowerTarget(co2Data, count)
    else
        print(#co2Data)
        for _,binary in pairs(co2Data) do
            if string.sub(binary, count, count) == '0' then
                result['co2Rating'] = binary
            end
        end
       break
    end
end

--[[
print(result['oxygenRating'], result['co2Rating'])
print(tonumber(result['oxygenRating'], 2), tonumber(result['co2Rating'], 2))
print(tonumber(result['oxygenRating'], 2) * tonumber(result['co2Rating'], 2))

]]