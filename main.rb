require_relative 'lib/board'
require 'rainbow'

print "This is a game of tic-tac-toe. To start the game, type 'y' and press enter: "
start_game = gets.chomp

while start_game != 'y'
  print "You must enter 'y' to begin: "
  start_game = gets.chomp
end

puts "\n"
TicTacToe.new
