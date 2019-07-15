require_relative 'board'
require_relative 'player'
require_relative "./module.rb"

class Game
  def initialize(player_1, player_2, board = Board.new)

    @player_1 = player_1
    @player_2 = player_2

    @board = board

    @current_player = @player_1;
  end

  include Ask
  def play

      loop do
        @board.render
            
        coordinates
        coords = gets.strip.split(",").map(&:to_i)

        while(!@board.add_piece(coords, @current_player.color))
            coordinates
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
          puts "Ugh!, you've drawn..."
          true
      else
          false
      end
  end

  def switch_players
      @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end
end
