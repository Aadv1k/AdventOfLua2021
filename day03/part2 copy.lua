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
    if oneCount > zeroCount then 
        greater=1 
        lower=0 
        equal=false 
    elseif oneCount < zeroCount then 
        greater=0 
        lower=1 
        equal=false
    elseif greater == lower then
        equal=true 
    end

    return {oneCount = oneCount, zeroCount = zeroCount, greater=greater, lower=lower, equal=equal}
end

-- Function to return a table with the data where the letter is present in the given position
function filterByGreaterTarget(data, position)
    local target = nOfBinary(data, position)
    local filteredData = {}
    for _,letters in pairs(data) do
        if target['equal'] then
            table.insert(filteredData, letters)
            return filteredData
        elseif string.sub(letters, position, position) == tostring(target['greater']) then
            table.insert(filteredData, letters)
        end
    end

    return filteredData
end

function filterByLowerTarget(data, position)
    local target = nOfBinary(data, position)
    local filteredData = {}
    for _,letters in pairs(data) do
        if target['equal'] then
            table.insert(filteredData, letters)
            return filteredData
        elseif string.sub(letters, position, position) == tostring(target['greater']) then
            table.insert(filteredData, letters)
        end
    end

    return filteredData
end

local result = {
    oxygenRating = nil,
    co2Rating = nil,
}