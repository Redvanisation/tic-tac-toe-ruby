class Board
    def initialize
        @board = Array.new(3){Array.new(3)}
    end

    def render
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
            @board[coords[0]][coords[1]] = peice
            true
        end
        false
    end

    # Checking if the piece coordinates are valid or not:

    def piece_location_valid?(coords)
        if valid_coords?(coords)
            coords_available?(coords)
        end
        puts "Piece coordinates are out of bounds!"
    end

    def valid_coords?(coords)
        if (0..2).include?(coords[0]) && (0..2).include?(coords[1])
            true
        end
        false
    end

    def coords_available?(coords)
        if @board[coords[0]][coords[1]].nil?
            true
        end
        false
    end


end