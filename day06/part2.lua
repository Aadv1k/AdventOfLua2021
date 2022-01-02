local file = io.open('./input.txt')
local contents = file:read('all')
file:close()

lf = {}
for i in contents:gmatch('%d+') do
	table.insert(lf, tonumber(i))
end
initial = {}

for i,v in pairs(lf) do
	if initial[v] == nil then
		initial[v] = 0
	end
	initial[v] = initial[v] + 1
end

days = 256

for count=1,days do
	new = {}
	for key,item in pairs(initial) do
		if key == 0 then
			if not new[6] then
				new[6] = 0
			end
			new[6] = new[6] + initial[key]

			if not new[8] then
				new[8] = 0
			end
			new[8] = new[8] + initial[key]
		else
			if not new[key-1]  then
				new[key-1]  = 0
			end
			new[key-1] = new[key-1] + initial[key]
		end
	end
	initial = new
end

count = 0
for i,v in pairs(initial) do
	print(i..': '..v)
	count = count + v
end

print('There will be '..count..' number of fish after '..days..' days ')

