require_relative 'lib/board'

puts "This is a game of tic-tac-toe. To start the game, type 'y' and press enter."
start_game = gets.chomp

while start_game != 'y'
  puts "You must enter 'y' to begin."
  start_game = gets.chomp
end

puts "\n"
TicTacToe.new
