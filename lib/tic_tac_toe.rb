<<<<<<< HEAD
=======
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

>>>>>>> 23e458bdb2b7a06b40d17986bf9e847a115e4b2b
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
CHARACTER_SET = ["X", "O"]

# ------- win helper methods --------

#Returns true if the board has a win on it and false if it does not
def won?(board)
  any_winning_combination(board)
end

#Iterates through all of the WIN_COMBINATIONS and see if there is a winning combination
def any_winning_combination(board)
  WIN_COMBINATIONS.detect do |combination|
    any_char_combo?(combination, board)
  end
end

#Checks winning_combo? for all characters
def any_char_combo?(combination, board)
  CHARACTER_SET.any? do |character|
    winning_combo?(combination, board, character)
  end
end

#Sees if there is a win for a specific combination, board, and character.
def winning_combo?(combination, board, character = "X")
  combination.all? do |index|
    board[index] == character
  end
end

#-------- full methods --------

def position_taken_spot?(spot)
  spot != " " && spot != "" && spot != nil
end

def full?(board)
  board.all? {|spot| position_taken_spot?(spot)}
end

#-------- draw methods --------

def draw?(board)
  !won?(board) && full?(board)
end

#-------- over? methods --------

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

#-------- winner methods --------

def winner(board)
  #Stores the value of won
  win = won?(board)
  #Checks to see if it it true
  if win
    #Returns the value for the thing in the board for index won[0]
    board[win[0]]
  end
end

#Returns the number of turns that have elapsed from a given board
def turn_count(board)
  turn = 0
  board.each do |spot|
    if spot != " " && spot != "" && spot != nil 
      turn += 1 
    end
  end
  turn
end

<<<<<<< HEAD
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

=======
>>>>>>> 23e458bdb2b7a06b40d17986bf9e847a115e4b2b
#Returns the cahracer of the current player
def current_player(board)
  turn  = turn_count(board)
  if turn % 2  == 0 #is even
    "X"
  else
    "O"
  end
end

# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

<<<<<<< HEAD
def move(board, index, current_player)
  board[index] = current_player
=======
def move(board, index)
  board[index] = current_player(board)
>>>>>>> 23e458bdb2b7a06b40d17986bf9e847a115e4b2b
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
<<<<<<< HEAD
    move(board, index, current_player(board))
=======
    move(board, index)
>>>>>>> 23e458bdb2b7a06b40d17986bf9e847a115e4b2b
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  until over?(board) do
    turn(board)
  end
  if winner(board)
<<<<<<< HEAD
    puts "Congratulations #{winner(board)}!"
  elsif
    puts "Cat's Game!"
=======
    puts "Congratulations #{winner(board)!}"
  elsif
    puts "Sorry guys, it was a draw"
>>>>>>> 23e458bdb2b7a06b40d17986bf9e847a115e4b2b
  end
end