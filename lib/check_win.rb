# Checks whether a winner has been found and announces the results
module Winnable
  def check_win
    if new_board.any?(%w[x x x]) == true
      @win_flag = true
    elsif new_board.any?(%w[o o o]) == true
      @win_flag = true
    elsif new_board[0][0] == new_board[1][0] && new_board[1][0] == new_board[2][0]
      @win_flag = true
    elsif new_board[0][1] == new_board[1][1] && new_board[1][1] == new_board[2][1]
      @win_flag = true
    elsif new_board[0][2] == new_board[1][2] && new_board[1][2] == new_board[2][2]
      @win_flag = true
    elsif new_board[0][0] == new_board[1][1] && new_board[1][1] == new_board[2][2]
      @win_flag = true
    elsif new_board[0][2] == new_board[1][1] && new_board[1][1] == new_board[2][0]
      @win_flag = true
    else
      @win_flag
    end
  end

  def announce_results
    if @win_flag == true && @move_flag == 1
      puts Rainbow('Player 1 wins!').blink
    elsif @win_flag == true && @move_flag == 0
      puts Rainbow('Player 2 wins!').blink
    elsif @win_flag == false && @moves == 9
      puts Rainbow("Neither wins. It\'s a draw!").blink
    end
  end
end
