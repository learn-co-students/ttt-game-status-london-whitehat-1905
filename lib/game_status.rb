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
    [6,4,2]
]

def won?(board)
  if (board.all? { |value| value == ' ' }) == true  # if board is empty
    return false
  end


  if (WIN_COMBINATIONS.each do |combination|
    if (board[combination[0]] == 'X') && (board[combination[1]] == 'X') && (board[combination[2]] == 'X')
      return combination
    end

    if (board[combination[0]] == 'O') && (board[combination[1]] == 'O') && (board[combination[2]] == 'O')
      return combination
    end
  end) != false
    return false # draw
  end

end

def full?(board)
  if (board.all? { |value| value != ' ' }) == true
    true
  end
end


def draw?(board)
  if full?(board) == true
    if won?(board) == false
      return true
    end
  end

  false
end

def over?(board)
  if won?(board)
    return true
  end

  if draw?(board)
    return true
  end

  if won?(board) == false && draw?(board) == false
    return false
  end
end

def winner(board)
  combo = won?(board)

  if combo
    combo.each do |x|
      if board[x] == 'X'
        return 'X'
      end

      if board[x] == 'O'
        return 'O'
      end
    end
  end


end

board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
puts winner(board)