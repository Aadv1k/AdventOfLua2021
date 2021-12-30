# Advent of Code 2021 in Lua
Solutions for adventOfCode In lua (ps-It's my first time working with lua, so feel free to point out any bad practices.)

### Explanation
- DAY#3
	- **Part1**- For part one, `n` (where n is equal to the length of the digit)
	  nested table within the table `col` is created, this contains the values
	  of respective columns like so `0100, 0111, -> {0, 0}, {1, 1}, {0, 1}, {0,
	  1}` in the real case, 12 such columns will be created. then we just loop
	  through ever table, count the occurences of `0` or `1`, add them to a
	  central value, then decide the binary digit based on which one of the
	  values are bigger (for the epsilion, its the opposite). we then convert
	  these binaries to decimals, and multiply them together.
	- **Part2**- For part two, we have a function called `getNofBin` which takes
	  in a table, and a position as a requirements, it then returns the
	  quantity of zeros and one in the given position, and which one is
	  greater. In the first function we repeat the loop until we are left where
	  the `getNofBin` returns `nil` which says that the numbers are equal, in
	  which case, we get the number with `1` in `getOxyGen` and `0` in
	  `getCo2Gen`. In the second function, for `getCo2Gen` we invert the
	  values, so `greater = 0 -> greater = 1` and vice versa.
- DAY#4
	- **Part1**- This solution involved a lot of cutting and chopping. So to
	  find the solution, first the given data was lexed in to indexable tables,
	  so `1,0,1,1,2,3 -> {{1, 0, 1}, {1, 2, 3}}` It is important to now, that
	  the numerical values were attatched as a table `{val=1, marked=false}`
	  this is done to check the winning board. the we have two helper functions
	  checkCol and checkRow, both of which take in a block, and a position,
	  and return true or false based on the marked value of the numbers (so
	  true would mean that all numbers in a row or col were marked, thus
	  marking our winner) in simBingo We loop through all the draws and the
	  blocks, we pass the block through checkCol or checkRow, which if
	  returns true, we end the function there and return the block, and the
	  draw before the current draw, else we just loop through all the num
	  values, and if they match the draw value, we "mark" them by setting
	  `marked = true`.
	- **Part2**- I suspect there might be a better solution to do this, but
	  what I ended up implementing was a function winningBlockIndex which is
	  a modified version of simBingo and return the index of the block which
	  one. We then have a for loop which extends till #blocks-1 (total number
	  of blocks minus 1, so 2 in sample.txt), removing the block with the
	  winningBlockIndex, so finally we are left with a table with just a
	  single block, which we can say for sure, is the last winning one.
