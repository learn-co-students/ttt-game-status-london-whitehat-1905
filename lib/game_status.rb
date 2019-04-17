# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won?(board)
  winning_combo = WIN_COMBINATIONS
    .filter {|combo|
      combo.all? {|index| position_taken?(board, index)}
    }
    .filter {|combo|
      combo.map {|index| board[index]} .uniq.length == 1
    }
  

  winning_combo.empty? ? nil : winning_combo.first
end

def full?(board)
  (0..8).to_a.map {|i| position_taken?(board, i)} .all?
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if !won?(board) then return nil end

  winning_combo = WIN_COMBINATIONS
    .filter {|combo|
      combo.all? {|index| position_taken?(board, index)}
    }
    .filter {|combo|
      combo.map {|index| board[index]} .uniq.length == 1
    }
    .first
    .map {|i| board[i]}
    .uniq
    .first
end