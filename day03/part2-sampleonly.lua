-- works only on samples
local file = io.open('./input.txt')
local content = file:read("a")
file:close()

local data={}
for item in content:gmatch('[^\n\r]+') do
    table.insert(data, item)
end

-- Calculate the first element of every item
-- Get the highest frequency among them

function getFreqBin(data, pos)
    current = ''
    print(current)
   for _,item in pairs(data) do
      current = current..string.sub(item, pos, pos)
   end

   _, freq0 = current:gsub('0', '')
   _, freq1 = current:gsub('1', '')

   if freq0 > freq1 then
       greater = 0
    elseif freq1 > freq0 then
        greater = 1
    else
        greater = nil
   end

        
   return {
       zeroCount = freq0,
       oneCount = freq1,
       greater = greater
    }

end

getFreqBin(data, 1)

function getOxyRating(data) 
-- For the oxygen rating
    for count=1,#data[1],1 do
        local filteredData = {}
        local currentCol = {}

        for _,v in pairs(data) do 
            table.insert(currentCol, v:sub(count, count))
        end

        getFreqBin(currentCol, 1)
        if greater == nil then
            for _,v in pairs(data) do 
                if v:sub(count, count) == '1' then 
                    return v
                end
            end
            break
        elseif greater == 1 then
            for _,v in pairs(data) do 
                if v:sub(count, count) == '1' then 
                    table.insert(filteredData, v)
                end
            end
        elseif greater == 0 then
            for _,v in pairs(data) do 
                if v:sub(count, count) == '0' then 
                    table.insert(filteredData, v)
                end
            end
        end
        data = filteredData
    end
end

function getCo2Rating(data) 
    -- For the co2 rating
    for count=1,#data[1],1 do
        local filteredData = {}
        local currentCol = {}
        for _,v in pairs(data) do 
            table.insert(currentCol, v:sub(count, count))
        end

        getFreqBin(currentCol, 1)
        if greater == nil then
            for _,v in pairs(data) do 
                if v:sub(count, count) == '0' then
                    return v
                end
            end
            break
        elseif greater == 1 then
            for _,v in pairs(data) do 
                if v:sub(count, count) == '0' then
                    table.insert(filteredData, v)
                end
            end
        elseif greater == 0 then
            for _,v in pairs(data) do 
                if v:sub(count, count) == '1' then
                    table.insert(filteredData, v)
                end
            end
        end
        data = filteredData
    end
end

o2rating = getOxyRating(data)
co2rating = getCo2Rating(data)

print('Oxygen rating: '..o2rating)
print('CO2 rating: '..co2rating)
print('Answer: '..tonumber(o2rating, 2)*tonumber(co2rating, 2))


-- Move on to the next number
-- Check if the frequencies are equal if so, use the number with the higher frequency (oxygen) and break the loopa
