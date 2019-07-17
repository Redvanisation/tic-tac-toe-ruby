require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

puts
puts
puts "Welcome to Tictactoe game    "
puts
puts "The following is a table showing the slots numbers"
puts
puts "    *******************    "
puts "      1      2      3      "
puts "      4      5      6      "
puts "      7      8      9      "
puts "    *******************    "
puts

player_1_name = ""
player_2_name = ""

while player_1_name.empty?
  print "Please enter the name of first player(1) : "
  player_1_name = gets.chomp
  player_1 = Player.new(player_1_name, 'X')
end

while player_2_name.empty?
  print "Please enter the name of second player(2) : "
  player_2_name = gets.chomp
  player_2 = Player.new(player_2_name, 'O')
end

puts
puts "Player 1: #{player_1.name}, Color: #{player_1.color} | Player 2: #{player_2.name}, Color: #{player_2.color}"
puts


game = Game.new(player_1, player_2)
game.play
