------------------------------------------------------------------
-- PROJ: untils.lua
-- AUTHOR: Aadvik <aadv1k@outlook.com>
-- DESCRIPTION: A simple utils file for lua inspired by JavaScript
--              and some other helpful functions
-- LICENCE: UNILISENCE
------------------------------------------------------------------

function table.indexOf(tab, elem)
    for i,v in pairs(tab) do
        if v == elem then
            return i
        end
    end
    return nil
end

function table.lastIndexOf(tab, elem)
    for count=#tab,1,-1 do
        if tab[count] == elem then
            return count
        end
    end
    return nil
end

function table.reverse(tab)
   local result = {}
   for count=#tab,1,-1 do
       table.insert(result, tab[count])
   end
   return result
end

-- is this how filter works?
function table.filter(tab, target)
    local result = {}
    for _,item in pairs(tab) do
        if target(item) then
            table.insert(result, target(item))
        end
    end
    return result
end

function table.stringify(tab)
    local s = ''
    for count=1,#tab do
        if count+1 > #tab then
            if type(tab[count]) == 'string' then
                s = s.."\""..tab[count].."\""
            elseif type(tab[count]) == "boolean" then
                s = s..tostring(tab[count])
            else
                s = s..tab[count]
            end
            break

        elseif type(tab[count]) == 'string' then
            s = s.."\""..tab[count].."\","
        elseif type(tab[count]) == 'boolean' then
            s = s..tostring(tab[count])..","
        else
            s = s..tab[count]..','
        end

    end
    return '{ '..s..' }'
end

-- A simple "Just works" Implementation, probably would need to make a lexer,
-- to really make this work
function table.print(tab)
    local s = ''
    for count=1,#tab do
        if count+1 > #tab then
            if type(tab[count]) == 'string' then
                s = s.."\""..tab[count].."\""
            elseif type(tab[count]) == 'table' then
                s = s..'\t'..table.stringify(tab[count])..'\n'
            else
                s = s..tab[count]
            end
            break

        elseif type(tab[count]) == 'string' then
            s = s.."\""..tab[count].."\", "
        elseif type(tab[count]) == 'table' then
            s = s..'\t'..table.stringify(tab[count])..',\n '
        else
            s = s..tab[count]..', '
        end
    end
    print('{ '..s..' }')
end

function string.matrix(inp)
    local result = {}
    for lines in inp:gmatch('[^\r\n]+') do
        local line = {}
        for count=1,#lines do
            table.insert(line, lines:sub(count, count))
        end
        table.insert(result, line)
    end
    return result
end
