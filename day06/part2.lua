-- BASICALLY IMPLEMENT KEY..TABLES instead of the normal ones as that takes
-- more time

local file = io.open('./input.txt')
local contents = file:read('all')
file:close()

lf = {}
for i in contents:gmatch('%d+') do
	table.insert(lf, tonumber(i))
end

local days = 256

states = {}

for count=1,days do
	for index,v in pairs(lf) do
		i = tostring(index)
		if v == 0 then
			if states[i] ~= nil then
				states[i] = 6
				states['9'] = 9
			else
				states[i] = 0
			end
		elseif v then
			if states[i] ~= nil then
				states[i] = states[i] - 1
			end
		end
	end
end
for _,v in pairs(states) do
	print(_, v)
end

