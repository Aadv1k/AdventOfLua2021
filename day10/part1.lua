require('utils')

local file = io.open('input.txt')
local contents = file:read('all')
file:close()

local brackets = {}
brackets['('] = ')'
brackets['{'] = '}'
brackets['['] = ']'
brackets['<'] = '>'

local points = {}
points[')']=3
points[']']=57
points['}']=1197
points['>']=25137

local unmatched = {}
unmatched[')'] = 0
unmatched['}'] = 0
unmatched[']'] = 0
unmatched['>'] = 0

local target = contents:matrix()

for i,lines in pairs(target) do
    local stack = {}
    for _,elems in pairs(lines) do
        
        -- if its a closing pair, we put it on the stack
        if table.indexOf({'(', '{', '[', '<'}, elems) ~= nil then
            table.insert(stack, brackets[elems])
        else
            -- we remove the topmost element at the stack
            -- and compare it to the current element 
            local top = table.remove(stack, #stack)
            if top ~= elems then
                -- it is corupted
                unmatched[elems] = unmatched[elems] + 1 
            end

        end
    end
end

local result = 0
for k,v in pairs(unmatched) do
    result = result + points[k]*v
end

print("Total syntax error score is "..result)


