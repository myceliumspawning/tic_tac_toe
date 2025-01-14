require_relative 'check_win'

# Starts the game, allowing player selection and board updates
class TicTacToe
  include Winnable
  attr_reader :new_board

  def initialize
    @new_board = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
    ]
    @moves = 0
    @move_flag = 0
    @win_flag = false
    @selection = 0
    @selected = []
    display_board
    puts Rainbow("Pick the number that corresponds with the position you wish to choose.\n").tomato
    start_game
  end

  private

  def start_game
    9.times do
      unless @win_flag == true
        if @move_flag == 0
          select_player(1, 1)
          update_board(Rainbow('x').goldenrod)
        else
          select_player(2, 0)
          update_board(Rainbow('o').darkturquoise)
        end
      end
    end
  end

  def select_player(player_number, move_flag)
    print "Player #{player_number}, make your move: "
    @selection = gets.chomp
    while @selection !~ /^[1-9]$/
      print "You need to select a number between 1 to 9, Player #{player_number}. Make your move: "
      @selection = gets.chomp
    end
    while @selected.include?(@selection) == true
      print 'That space is taken. Choose another: '
      @selection = gets.chomp
    end
    @selected << @selection
    puts "\n"
    @move_flag = move_flag
    @moves += 1
  end

  def update_board(play)
    @new_board.each do |element|
      next unless element.is_a?(Array)

      element.map! do |sub_element|
        if sub_element == @selection
          play
        else
          sub_element
        end
      end
    end
    display_board
    check_win
    announce_results
  end

  def display_board
    print_board
    puts "\n"
  end

  def print_board
    @new_board.each do |row|
      print '|'
      row.each { |cell| print "#{cell}|" }
      puts "\n"
    end
  end
end
