module Winnable
  def check_win
    case
    when new_board.any?(["x", "x", "x"]) == true
      @win_flag = true
    when new_board.any?(["o", "o", "o"]) == true
      @win_flag = true
    when new_board[0][0] == new_board[1][0] && new_board[1][0] == new_board[2][0]
      @win_flag = true
    when new_board[0][1] == new_board[1][1] && new_board[1][1] == new_board[2][1]
      @win_flag = true
    when new_board[0][2] == new_board[1][2] && new_board[1][2] == new_board[2][2]
      @win_flag = true
    when new_board[0][0] == new_board[1][1] && new_board[1][1] == new_board[2][2]
      @win_flag = true
    when new_board[0][2] == new_board[1][1] && new_board[1][1] == new_board[2][0]
      @win_flag = true
    else
      @win_flag
    end
  end

  def announce_results
    if @win_flag == true && @move_flag == 1
      puts "Player 1 wins!"
    elsif @win_flag == true && @move_flag == 0
      puts "Player 2 wins!"
    elsif @win_flag == false && @moves == 9
      puts "Neither wins. It\'s a draw!"
    end
  end
end