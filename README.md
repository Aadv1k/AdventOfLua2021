# Advent of Code 2021 in Lua
Solutions for adventOfCode In lua (ps-It's my first time working with lua, so feel free to point out any bad practices.)

### Explanation
- DAY#3
	- Part1 - For part one, `n` (where n is equal to the length of the digit)
	  nested table within the table `col` is created, this contains the values
	  of respective columns like so `0100, 0111, -> {0, 0}, {1, 1}, {0, 1}, {0,
	  1}` in the real case, 12 such columns will be created. then we just loop
	  through ever table, count the occurences of `0` or `1`, add them to a
	  central value, then decide the binary digit based on which one of the
	  values are bigger (for the epsilion, its the opposite). we then convert
	  these binaries to decimals, and multiply them together.
	- Part2 - For part two, we have a function called `getNofBin` which takes
	  in a table, and a position as a requirements, it then returns the
	  quantity of zeros and one in the given position, and which one is
	  greater. In the first function we repeat the loop until we are left where
	  the `getNofBin` returns `nil` which says that the numbers are equal, in
	  which case, we get the number with `1` in `getOxyGen` and `0` in
	  `getCo2Gen`. In the second function, for `getCo2Gen` we invert the
	  values, so `greater = 0 -> greater = 1` and vice versa.
- DAY#4
	- Part1 - So, this solution involved a lot of chopping and slicing to
	  create structured data. So first, we read all the numerical data of the
	  blocks, putting the numerical data, and `marked` which is set to false by
	  default, which defines if the number is marked or not into a table, then
	  we go through that table, and put sets of 5 into tables, acting as "rows"
	  (in the sample, there are 15 rows) then we go through the rows and put
	  those rows into sets of 5, acting like "blocks", so each block is 5x5.
	  Then to find the solution, We have a `for` loop, which loops through ever
	  draw number, then we loop through our "bingo" board, where we have two
	  functions, `checkCol` and `checkRow`, to check based on `marked` property
	  of the numbers if we have a match or not, if we do, the function
	  `simBingo` is stopped there, and a table containing the winning block,
	  index and the number before the current draw. If the functions return
	  false, we then continue looping through every row, setting `marked` to
	  true in the numbers which are equal to the the draw number.
