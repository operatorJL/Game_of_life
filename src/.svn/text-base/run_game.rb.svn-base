require 'green_shoes'
require 'game_of_life'

def initial_pattern
  [[1, 1],[1, 2],[1,3],[2,0],[2,1],[2,2],
  [1,5],[1,6],[1,7],
  [3,8],[3,9],[4,8],[4,9],
  [6,1],[6,2],[7,1],[7,2],[8,3],[8,4],[9,3],[9,4],
  [9,9]]
end



Shoes.app(width: 200, height: 200) do 
  @cell_dimension = 20
  
  grid = next_grid(10)
  
  set_cell_alive(grid, initial_pattern)

  animate(2) do |frame|
    stack do
      grid.each_index do |row|
        grid.each_index do |col|
          if grid[row][col]
            stroke rgb(0.5, 0.5, 0.7)
            fill rgb(255, 250, 250)
            rect(col * @cell_dimension, row * @cell_dimension,  @cell_dimension, @cell_dimension)   
          else
            stroke rgb(0.5, 0.5, 0.7)
            fill rgb(0, 0, 0)
            rect(col * @cell_dimension, row * @cell_dimension,
                  @cell_dimension, @cell_dimension)
          end 
        end
      end
      grid = next_generation(grid)
    end
  end
end


