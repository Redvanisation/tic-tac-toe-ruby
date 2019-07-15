require_relative 'board'
require_relative 'player'

class Game
  def initialize(player_1, player_2, board = Board.new)

    @player_1 = player_1
    @player_2 = player_2

    @board = board

    @current_player = @player_1;
  end

  def play

      loop do
           @board.render

           puts "#{@current_player.name}(#{@current_player.color}) please enter the coordinates in form: x, y:"

           coords = gets.strip.split(",").map(&:to_i)

           while(!@board.add_piece(coords, @current_player.color))
             puts "#{@current_player.name}(#{@current_player.color}) please enter the coordinates in form: x, y:"

             coords = gets.strip.split(",").map(&:to_i)
           end

           @board.add_piece(coords, @current_player.color)

           break if check_game_over
           switch_players
       end
  end

  def check_game_over
      check_victory || check_draw
  end

  def check_victory
      if @board.winning_combination?(@current_player.color)
          puts "Congratulations #{@current_player.name}, you win!"
          true
      else
          false
      end
  end

  def check_draw
      if @board.full?
          puts "Bummer, you've drawn..."
          true
      else
          false
      end
  end

  def switch_players
      @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end
end
