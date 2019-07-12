class Board
    def initialize
        @board = Array.new(3){Array.new(3)}
    end

    def render
        puts
        @board.each do |row|
            row.each do |cell|
                cell.nil? ? print("-") : print(cell.to_s)
            end
            puts
        end
        puts
    end

    #adding piece
    def add_piece(coords, piece)
        if piece_location_valid?(coords)
            @board[coords[0]][coords[1]] = piece
            true
        end
        false
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
        if (0..2).include?(coords[0]) && (0..2).include?(coords[1])
          true
        else
          false
        end
    end

    def coords_available?(coords)
        if @board[coords[0]][coords[1]].nil?
            return true
        else
          false
        end
    end

    def winning_combination?(piece)
        winning_diagonal?(piece)   ||
        winning_horizontal?(piece) ||
        winning_vertical?(piece)
    end

    def winning_diagonal?(piece)
        diagonals.any? do |diag|
            diag.all?{|cell| cell == piece }
        end
    end

    def winning_vertical?(piece)
        @board.any? do |vert|
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

    def horizontals
        horizontals = []
        3.times do |i|
            horizontals << [@board[0][i],@board[1][i],@board[2][i]]
        end
        horizontals
    end

    def full?
        @board.all? do |row|
            row.none? {|c| c.nil? }
        end
    end

end
