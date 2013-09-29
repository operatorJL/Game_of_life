ALIVE = true
DEAD = false

def is_alive?(alive, neighbors)
  alive && neighbors == 2 || neighbors == 3
end
  
def neighbor_count(grid, cell_row, cell_col)
  neighborhood = [[-1,-1], [-1,0], [-1,1], [0,-1], 
                      [0,1], [1,-1], [1,0], [1,1]]
  neighbor_count = 0

  neighborhood.each do |neighborhood_row, neighborhood_col|
    row_index = cell_row + neighborhood_row
    column_index = cell_col + neighborhood_col
    if within_grid?(grid, row_index, column_index) &&
          grid_indexes_greater_than_zero?(row_index, column_index)
      neighbor_count +=1 if grid[row_index][column_index]
    end
  end  
  neighbor_count
end

def next_generation(old_grid)
  new_grid = next_grid(old_grid.size)
  
  old_grid.each_index do |row_index|
    old_grid.each_index do |col_index|
      new_grid[row_index][col_index] = is_alive?(old_grid[row_index][col_index], 
                                      neighbor_count(old_grid, row_index, col_index))
    end
  end
  new_grid
end

def within_grid?(grid, row, column)
  row < grid.length && column < grid.length 
end

def grid_indexes_greater_than_zero?(row, column)
  row >= 0 && column >= 0
end

def next_grid(grid_size)
  Array.new(grid_size) do |row|
     Array.new(grid_size) do |col|
       DEAD
     end
   end
end

def set_cell_alive(grid, set_alive_cells)
  set_alive_cells.each do |row,col|
  grid[row][col] = ALIVE
  end
end
   
  