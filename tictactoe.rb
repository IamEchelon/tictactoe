def initialize_board
  board = {}
  (1..9).each { |position| board[position] = " " }
  board
end

def available_positions(board)
  board.keys.select { |position| board[position] == " " }
end

def player_selects(board)
  begin
    puts "To place an X pick a value from 1-9"
    position = gets.chomp.to_i
  end until available_positions(board).include?(position)
  board[position] = "X"
end

def computer_selects(board)
  position = available_positions(board).sample
  board[position] = "O"
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count("X") == 3
    return "Computer" if board.values_at(*line).count("O") == 3
  end
  nil
end

def spaces_filled?(board)
  available_positions(board) == []
end

def draw_board(board)
  system 'clear'
  puts
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts
end


board = initialize_board
draw_board(board)



begin
  player_selects(board)
  draw_board(board)
  computer_selects(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || spaces_filled?(board)


if winner
  puts "#{winner} won!"
else
  puts "It's a tie"
end
