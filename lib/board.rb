class TicTacToe
  attr_reader :new_board, :win_flag, :moves

  def initialize
    @move_flag = 0
    @selection = 0
    @new_board = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9']
    ]
    @win_flag = false
    @moves = 0
    display_board
    puts "Pick the number that corresponds with the position you wish to choose."
    start_game
  end

  private

  def start_game
    9.times do |player| unless @win_flag == true
      if @move_flag == 0
        select_player(1, 1)
        update_board("x")
      else
        select_player(2, 0)
        update_board("o")
      end
      end
    end
  end

  def select_player(player_number, move_flag)
    print "Player #{player_number}, make your move: "
    @selection = gets.chomp
    puts "\n"
    @move_flag = move_flag
    @moves += 1
  end

  def update_board(play)
    @new_board.each do |element|
      if element.is_a?(Array)
        element.map! do |sub_element|
          if sub_element == @selection
            sub_element = play
          else 
            sub_element
          end
        end
      end
    end
    display_board
    check_win
    if @win_flag == true && @move_flag == 1
      puts "Player 1 wins!"
    elsif @win_flag == true && @move_flag == 0
      puts "Player 2 wins!"
    elsif @win_flag == false && @moves == 9
      puts "Neither wins. It\'s a draw!"
    end
  end

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

  def display_board
    self.print_board
    puts "\n"
  end

  def print_board
    @new_board.each do |row|
      print "|"
      row.each { |cell| print "#{cell}|" }
      puts "\n"
    end
  end
end
