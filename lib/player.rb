# require_relative '../bin/main.rb'

class Player
    attr_accessor :name, :piece

    def initialize(name = "Anonymous Player", piece, board)
        raise "Piece should be a symbol" unless piece.is_a?(Symbol)

        @name = name
        @board = board
        @piece = piece
    end

    # Getting coordinates
    def get_coords
        loop do
            coords = coordinates

            if validate_coordinates(coords)
                if @board.add_piece(coords, @piece)
                    break
                end
            end
        end
    end

    #asking for coordinates
    require_relative "./module.rb"
    include Ask

    # validating the coordinates format

    def validate_coordinates(coords)
        if coords.is_a?(Array) && coords.size == 2
            true
        else
            puts "Invalid Coordinates"
        end
    end

end
