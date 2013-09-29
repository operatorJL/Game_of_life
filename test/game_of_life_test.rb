$:.unshift(File.join(File.dirname(__FILE__), '..','src')) 
require 'test/unit'
require 'game_of_life'

class GameOfLifeTest < Test::Unit::TestCase
  DEAD = false
  ALIVE = true
  
  def test_live_cell_with_zero_neighbors_dies
     assert_equal DEAD, is_alive?(ALIVE, 0)
   end

   def test_live_cell_with_one_neighbor_dies
     assert_equal DEAD, is_alive?(ALIVE, 1)
   end
   
   def test_live_cell_with_two_neighbors_lives_on
     assert_equal ALIVE, is_alive?(ALIVE, 2)
   end
     
   def test_live_cell_with_three_neighbors_lives_on
     assert_equal ALIVE, is_alive?(ALIVE, 3)
   end
   
   def test_live_cell_has_four_neighbors_dies
     assert_equal DEAD, is_alive?(ALIVE, 4)
   end
   
   def test_live_cell_with_eight_neighbors_dies
    assert_equal DEAD, is_alive?(ALIVE, 8)
   end
       
   def test_dead_cell_with_zero_neighbor_stays_dead
     assert_equal DEAD, is_alive?(DEAD, 0)
   end
   
   def test_dead_cell_has_one_neighbor_stays_dead
     assert_equal DEAD, is_alive?(DEAD, 1)
   end
   
   def test_dead_cell_has_two_neighbors_stays_dead
     assert_equal DEAD, is_alive?(DEAD, 2)
   end
   
   def test_dead_cell_has_exactly_three_neighbors_comes_to_life
     assert_equal ALIVE, is_alive?(DEAD, 3)
   end
   
   def test_dead_cell_has_four_neighbors_stays_dead
     assert_equal DEAD, is_alive?(DEAD, 4)
   end
   
   def test_dead_cell_has_eight_neighbors_stays_dead
     assert_equal DEAD, is_alive?(DEAD, 8)
   end
   
   def test_cell_has_zero_alive_neighbors
     cells = cell_array 5, 5
     set_cell_alive(cells, [[2,2]])
     assert_equal 0, neighbor_count(cells,2,2)
   end
   
   def test_cell_has_one_neighbor_directly_above
     cells = cell_array 5, 5
     alive_cells = [[2,2],[1,2]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
   
   def test_cell_has_one_neighbor_top_right
     cells = cell_array 5, 5
     alive_cells = [[2, 2],[1, 3]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
    
   def test_cell_has_one_neighbor_directly_right
     cells = cell_array 5, 5
     alive_cells = [[2, 2],[2, 3]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
       
   def test_cell_has_one_neighbor_bottom_right
     cells = cell_array 5, 5
     alive_cells = [[2, 2],[3, 3]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
       
   def test_cell_has_one_neighbor_directly_below
     cells = cell_array 5, 5
     alive_cells = [[2, 2],[3, 2]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
         
   def test_cell_has_one_neighbor_bottom_left
     cells = cell_array 5, 5
     alive_cells = [[2, 2],[3, 1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
       
   def test_cell_has_one_neighbor_directly_left
     cells = cell_array 5, 5
     alive_cells = [[2, 2],[2, 1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
       
   def test_cell_has_one_neighbor_top_left
     cells = cell_array 5, 5
     alive_cells = has_one_neighbor
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
    
   def test_cell_has_two_neighbors
     cells = cell_array 5, 5
     alive_cells = has_two_neighbors
     set_cell_alive(cells, alive_cells)
     assert_equal 2,  neighbor_count(cells, 2, 2)
   end
       
   def test_cell_has_three_neighbors
     cells = cell_array 5, 5
     alive_cells = has_three_neighbors
     set_cell_alive(cells, alive_cells)
     assert_equal 3,  neighbor_count(cells, 2, 2)
   end
       
   def test_cell_has_four_neighbors
     cells = cell_array 5, 5
     alive_cells = has_four_neighbors
     set_cell_alive(cells, alive_cells)
     assert_equal 4,  neighbor_count(cells, 2, 2)
   end
         
   def test_cell_has_five_neighbors
     cells = cell_array 5, 5
     alive_cells = has_five_neighbors
     set_cell_alive(cells, alive_cells)
     assert_equal 5,  neighbor_count(cells, 2, 2)
   end
           
   def test_cell_has_six_neighbors
     cells = cell_array 5, 5
     alive_cells = has_six_neighbors
     set_cell_alive(cells, alive_cells)
     assert_equal 6,  neighbor_count(cells, 2, 2)
   end
             
   def test_cell_has_seven_neighbors
     cells = cell_array 5, 5
     alive_cells = has_seven_neighbors
     set_cell_alive(cells, alive_cells)
     assert_equal 7,  neighbor_count(cells, 2, 2)
   end
                 
   def test_cell_has_eight_neighbors
     cells = cell_array 5, 5
     alive_cells = has_eight_neighbors
     set_cell_alive(cells, alive_cells)
     assert_equal 8,  neighbor_count(cells, 2, 2)
   end      
   
   def test_cell_in_bottom_right_has_zero_neighbors
     cells = cell_array 3, 3
     alive_cells = [[2,2]]
     set_cell_alive(cells, alive_cells)
     assert_equal 0, neighbor_count(cells, 2, 2)
   end

   def test_cell_in_bottom_right_has_one_neighbor
     cells = cell_array 3, 3
     alive_cells = has_one_neighbor
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 2)
   end
      
   def test_cell_in_bottom_right_has_two_neighbors
     cells = cell_array 3, 3
     alive_cells = has_two_neighbors
     set_cell_alive(cells, alive_cells)
     assert_equal 2, neighbor_count(cells, 2, 2)
   end    
   
   def test_cell_in_bottom_right_has_three_neighbors
     cells = cell_array 3, 3
     alive_cells = [[2, 2],[1, 1],[1, 2],[2, 1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 3, neighbor_count(cells, 2, 2)
   end
   
   def test_cell_bottom_left_has_zero_neighbors
     cells = cell_array 3, 3
     alive_cells = [[2, 0]]
     set_cell_alive(cells, alive_cells)
     assert_equal 0, neighbor_count(cells, 2, 0)
   end
   
   def test_cell_bottom_left_has_one_neighbors
     cells = cell_array 3, 3
     alive_cells = [[2, 0],[2,1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 2, 0)
   end
   
   def test_cell_bottom_left_has_two_neighbors
     cells = cell_array 3, 3
     alive_cells = [[2, 0],[2,1],[1, 1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 2, neighbor_count(cells, 2, 0)
   end
   
   def test_cell_bottom_left_has_three_neighbors
     cells = cell_array 3, 3
     alive_cells = [[2, 0],[2,1],[1, 1],[1, 0]]
     set_cell_alive(cells, alive_cells)
     assert_equal 3, neighbor_count(cells, 2, 0)
   end    
   
   def test_cell_top_left_has_zero_neighbors
     cells = cell_array 3, 3
     alive_cells = [[0, 0]]
     set_cell_alive(cells, alive_cells)
     assert_equal 0, neighbor_count(cells, 0, 0)
   end
   
   def test_cell_top_left_has_one_neighbor
     cells = cell_array 3, 3
     alive_cells = [[0, 0], [0, 1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 0, 0)
   end
   
   def test_cell_top_left_has_two_neighbor
     cells = cell_array 3, 3
     alive_cells = [[0, 0], [0, 1],[1, 1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 2, neighbor_count(cells, 0, 0)
   end
   
   def test_cell_top_right_has_zero_neighbors
     cells = cell_array 3, 3
     alive_cells = [[0, 2]]
     set_cell_alive(cells, alive_cells)
     assert_equal 0, neighbor_count(cells, 0, 2)
   end
   
   def test_cell_top_right_has_one_neighbor
     cells = cell_array 3, 3
     alive_cells = [[0, 2], [0,1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 1, neighbor_count(cells, 0, 2)
   end
   
   def test_cell_top_right_has_two_neighbors
     cells = cell_array 3, 3
     alive_cells = [[0, 2], [0,1], [1,1]]
     set_cell_alive(cells, alive_cells)
     assert_equal 2, neighbor_count(cells, 0, 2)
   end
   
   def test_cell_top_right_has_three_neighbors
     cells = cell_array 3, 3
     alive_cells = [[0, 2], [0,1], [1,1], [1,2]]
     set_cell_alive(cells, alive_cells)
     assert_equal 3, neighbor_count(cells, 0, 2)
   end

   def test_dead_grid_is_dead_with_no_live_cells
    cells = cell_array 3, 3
    expected_cells = cell_array 3, 3
    assert_equal expected_cells, next_generation(cells)
   end
   
    def test_grid_with_one_cell_has_no_alive_cells_next_generation
     cells = cell_array 3, 3
     set_cell_alive(cells, [[1, 1]])
     expected_cells = cell_array 3, 3
     assert_equal expected_cells, next_generation(cells)
    end
    
    def test_next_pattern_still_life_block
      cells = cell_array 5, 5
      set_cell_alive(cells, [[1, 1],[1, 2],[2, 1],[2, 2]])
      expected_cells = cell_array 5, 5
      set_cell_alive(expected_cells, [[1, 1],[1, 2],[2, 1],[2, 2]])
      assert_equal expected_cells, next_generation(cells)
    end
    
    def test_pattern_oscillating_blinker
      cells = cell_array 3, 3
      set_cell_alive(cells, [[1, 0],[1, 1],[1, 2]])
      expected_cells = cell_array 3, 3
      set_cell_alive(expected_cells, [[0, 1],[1, 1],[2, 1]])
      assert_equal expected_cells, next_generation(cells)
    end
    
    def test_pattern_oscillating_toad
      cells = cell_array 5, 5
      set_cell_alive(cells, [[1, 1],[1, 2],[1, 3],[2, 0], [2, 1], [2, 2]])
      expected_cells = cell_array 5, 5
      set_cell_alive(expected_cells, [[1, 0],[2, 0],[3, 1],[0, 2],[1, 3],[2, 3]])
      assert_equal expected_cells, next_generation(cells)
    end
    
    def test_pattern_oscillating_beacon
      cells = cell_array 5, 5
      set_cell_alive(cells, [[1, 1],[1, 2],[2, 1],[2, 2], [3, 3], [3, 4],[4, 3], [4, 4]])
      expected_cells = cell_array 5, 5
      set_cell_alive(expected_cells, [[1, 1],[1, 2],[2, 1],[3, 4],[4, 3], [4, 4]])
      assert_equal expected_cells, next_generation(cells)
    end
    
    def test_pattern_still_life_beehive
      cells = cell_array 5, 5
      set_cell_alive(cells, [[1, 1],[1, 2],[2, 0],[2, 3], [3, 1], [3, 2]])
      expected_cells = cell_array 5, 5
      set_cell_alive(expected_cells, [[1, 1],[1, 2],[2, 0],[2, 3], [3, 1], [3, 2]])
      assert_equal expected_cells, next_generation(cells)
    end
    
    
    def test_pattern_still_life_loaf
      cells = cell_array 5, 5
      set_cell_alive(cells, [[0, 1],[0, 2],[1, 0],[1, 3], [2, 1], [2, 3],[3, 2]])
      expected_cells = cell_array 5, 5
      set_cell_alive(expected_cells, [[0, 1],[0, 2],[1, 0],[1, 3], [2, 1], [2, 3],[3, 2]])
      assert_equal expected_cells, next_generation(cells)
    end
    
    def test_pattern_still_life_boat
      cells = cell_array 5, 5
      set_cell_alive(cells, [[1, 1],[1, 2],[2, 1],[2, 3], [3, 2]])
      expected_cells = cell_array 5, 5
      set_cell_alive(expected_cells, [[1, 1],[1, 2],[2, 1],[2, 3], [3, 2]])
      assert_equal expected_cells, next_generation(cells)
    end
    
    def test_pattern_seen_in_reviews
      cells = cell_array 3, 3
      set_cell_alive(cells, [[0, 0],[1, 1],[0, 2]])
      expected_cells = cell_array 3, 3
      set_cell_alive(expected_cells, [[0, 1],[1, 1]])
      assert_equal expected_cells, next_generation(cells)
    end
    
   def cell_array(row_size, col_size)
     Array.new(row_size) do |row|
       Array.new(col_size) do |col|
         false
       end
     end
   end 
    
   def set_cell_alive(grid, set_alive_cells)
     set_alive_cells.each do |row,col|
       grid[row][col] = ALIVE
     end
   end
   
   def has_one_neighbor
     [[2, 2],[1, 1]]
   end  
   
   def has_two_neighbors
    [[2, 2],[1, 1],[1, 2]]
   end
   
   def has_three_neighbors
    [[2, 2],[1, 1],[1, 2], [1, 3]]
   end
   
   def has_four_neighbors
    [[2, 2],[1, 1],[1, 2],[1, 3],[2, 3]]
   end
   
   def has_five_neighbors
    [[2, 2],[1, 1],[1, 2],[1, 3],[2, 3],[3, 3]]
   end
   
   def has_six_neighbors
    [[2, 2],[1, 1],[1, 2],[1, 3],[2, 3],[3, 3],[3, 2]]
   end
   
   def has_seven_neighbors
    [[2, 2],[1, 1],[1, 2],[1, 3],[2, 3],[3, 3],[3, 2],[3, 1]]
   end
   
   def has_eight_neighbors
    [[2, 2],[1, 1],[1, 2],[1, 3],[2, 3],[3, 3],[3, 2],[3, 1],[2, 1]]
   end
end










