file = io.open('./input.txt')
local content = file:read('all')
file:close()

inp = {}
for i in content:gmatch('%d+') do
	table.insert(inp, tonumber(i))
end

function sum(t)
	result = 0
	for _,v in pairs(t) do
		result = result + v
	end
	return result
end

function factorial(n)
	result = 0
	for count=1,n do
		result = result + n
		n = n - 1
	end
	return result
end

fuelCost = {}
for target=1,#inp do
	currentCost = {}
	for _,pos in pairs(inp) do
		table.insert(currentCost, factorial(math.abs(pos-target)))
	end
	table.insert(fuelCost, sum(currentCost))
end

print(math.min(table.unpack(fuelCost))..' is the least possible fuel.')
