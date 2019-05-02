# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [2,5,8],
  [6,7,8],
  [0,3,6],
  [3,4,5],
  [1,4,7],
  [0,4,8],
  [2,4,6]
]
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all?{ |win_index| board[win_index] == "X" } ||
    win_combination.all? { |win_index| board[win_index] == "O" }
  end
end

def full?(board)
  if board.include?(" ") || board.include?("")
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
if draw?(board) || won?(board)
  return true
end
end
def winner(board)
  if !won?(board) 
    return nil
  else
    return board[won?(board)[0]]
end
end
