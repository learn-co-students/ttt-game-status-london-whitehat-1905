#won? function is broken idk


# Helper Method

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
  if empty?(board)
    false
  else
    for i in (0...8)
      x,y,z = WIN_COMBINATIONS[i]

      myBoard = [
        board[x],
        board[y],
        board[z]
      ]

      if myBoard.count("X") == 3
        return WIN_COMBINATIONS[i]
      end
      if myBoard.count("O") == 3
        return WIN_COMBINATIONS[i]
      end
    end
    return nil
  end

end


def full?(board)
  board.count("X") + board.count("O") == board.length
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def over?(board)
  if full?(board)
    true
  elsif won?(board)
    true
  else
    false
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def winner(board)
  print won?(board)
  if won?(board) == nil
    nil
  elsif board[won?(board)[0]] == "O"
    "O"
  else
    "X"
  end
end

def empty?(board)
  !(board.include?("X") || board.include?("O"))
end

