local file = io.open('./sample.txt')
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

for count=1,3 do
	cs = {}
	print('============')
	for k,v in pairs(initial) do
		print(k..': '..v)
		if k == 0 then

			if not cs[6] then
				cs[6] = 0
			end

			cs[6] = cs[6] + initial[k]

			if not cs[8] then
				cs[8] = 0
			end
		
			cs[8] = cs[8] + initial[k]

		else
			if not cs[k-1] then
				cs[k-1] = nil
			end

			cs[k-1] = initial[k]
		end
	end
	initial = cs
end



count = 0
for i,v in pairs(initial) do
	count = count + v
end

print(count)
