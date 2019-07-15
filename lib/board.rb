class Board
    def initialize
        @board = Array.new(3){Array.new(3, '')}
    end

    def render
      @board.each do |row|
        puts row.map { |cell| cell.empty? ? '_' : cell }.join(' ')
      end
    end

    #adding piece
    def add_piece(coords, piece)
        if piece_location_valid?(coords)
            @board[coords[0]][coords[1]] = piece
            true
        else
            false
        end
    end

    # Checking if the piece coordinates are valid or not:
    def piece_location_valid?(coords)
        if valid_coords?(coords)
            coords_available?(coords)
        else
          puts "Piece coordinates are out of bounds!"
        end
    end

    def valid_coords?(coords)
      (0..2).include?(coords[0]) && (0..2).include?(coords[1]) ? true : false
    end

    def coords_available?(coords)
        @board[coords[0]][coords[1]].empty? ? true : false
    end

    def winning_combination?(piece)
        winning_diagonal?(piece) || winning_horizontal?(piece) || winning_vertical?(piece)
    end

    def winning_diagonal?(piece)
        diagonals.any? do |diag|
            diag.all?{|cell| cell == piece }
        end
    end

    def winning_vertical?(piece)
        verticals.any? do |vert|
            vert.all?{|cell| cell == piece }
        end
    end

    def winning_horizontal?(piece)
        horizontals.any? do |horz|
            horz.all?{|cell| cell == piece }
        end
    end

    def diagonals
        [[ @board[0][0],@board[1][1],@board[2][2] ],[ @board[2][0],@board[1][1],@board[0][2] ]]
    end

    def verticals
        @board
    end

    def horizontals
        horizontals = []
        3.times do |i|
            horizontals << [@board[0][i],@board[1][i],@board[2][i]]
        end
        horizontals
    end

    def full?
        @board.all? do |row|
            row.none?(&:empty? )
        end
    end

end
