#!/usr/bin/env ruby
# this method creates the board for the game
def create_board
  matrix = Array.new(9)
  i = 0
  while i < matrix.length
    matrix[i] = '-'
    i += 1
  end
  matrix
end

# this method checks if the selected cell is empty: Empty means containing a '-'
def check_matrix_cell(cell_to_check)
  if $board[cell_to_check - 1] == '-'
    true
  else
    false
  end
end

# this method update the matrix according to the player movement
def update_matrix(player_id, selected_cell)
  if player_id == 1
    figure = 'X'
  else
    figure = 'O'
  end
  $board[selected_cell - 1] = figure
  print_board
end

# this method prints the board
def print_board
  i = 0
  while i < $board.length
    print $board[i] + ' '
    if (i + 1) % 3 == 0
      puts ' '
    end
    i += 1
  end
end

puts "Welcome, below you can find the board for the game:"
$board = create_board
print_board
i = 0
while i < $board.length
  if (i % 2) == 0
    player_id = 1
  else
    player_id = 2
  end
  puts "Player #{player_id} please maker your move:"
  valid_input = false
  while !valid_input
    player_selected_cell = gets.chomp.to_i
    if player_selected_cell > 0 && player_selected_cell < 10
      if check_matrix_cell(player_selected_cell)
        update_matrix(player_id, player_selected_cell)
        valid_input = true
      else
        puts "Cell already selected, please select another one:"
      end
    else
      puts "Please enter a number between 1 and 9:"
    end
  end
  i += 1
end
