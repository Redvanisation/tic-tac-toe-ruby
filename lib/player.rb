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
    def coordinates
        puts "#{@name}(#{@piece}) please enter the coordinates in form: x, y:"

        gets.strip.split(",").map(&:to_i)
    end

    # validating the coordinates format

    def validate_coordinates(coords)
        if coords.is_a?(Array) && coords.size == 2
            true
        else
            puts "Invalid Coordinates"
        end
    end

end
