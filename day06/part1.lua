local file = io.open('./input.txt')
local contents = file:read('all')
file:close()

lf = {}
for i in contents:gmatch('%d+') do
	table.insert(lf, tonumber(i))
end

local days = 80

for count=1,days do
	for index,v in  pairs(lf) do
		if v == 0 then
			lf[index] = 6
			 -- The new lanternfish starts with an internal timer of 8 and does
			 -- not start counting down until the next day.
			table.insert(lf, 9)
		elseif v then
			lf[index] = lf[index] - 1
		end
	end
	-- Uncomment this if you want a bunch of numbers filling your screen
	-- print('After '..count..' days: '..table.concat(lf, ' '))
end

print('Total fish: '..#lf..', After '..days..' days')
