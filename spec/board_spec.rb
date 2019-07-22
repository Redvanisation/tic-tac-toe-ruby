require "./lib/board"
require "./lib/game"
# require "./bin/main"

# game = Game.new
# game.play


RSpec.describe Board do

    let(:board){Board.new}
    let(:good_coords) { [0,0] }
    let(:bad_coords) { [5,9] }
    let(:piece) { "x" }


    describe "#add_piece" do

        it "returns true when the coordinates are valid" do
            expect(board.add_piece(good_coords,piece)).to eq(true)
        end

        it "returns false when the coordinates are not valid" do
            expect(board.add_piece(bad_coords,piece)).to eq(false)
        end
    end

    describe "#piece_location_valid?" do
        it "returns true when the location of the coords is valid" do
            expect(board.piece_location_valid?(good_coords)).to eq(true)
        end

        it "returns false when the location of the coords is not valid" do
            expect(board.piece_location_valid?(bad_coords)).to eq(false)
        end
    end


    describe "#valid_coords?" do
        it "returns true when the coordinates format is valid" do
            expect(board.valid_coords?(good_coords)).to eq(true)
        end

        it "returns false when the coordinates format is not valid" do
            expect(board.valid_coords?(bad_coords)).to eq(false)
        end
    end

    describe "#coords_available?" do
        it "returns true if the chosen coordinates location is available" do
            expect(board.coords_available?(good_coords)).to eq(true)
        end
    end

end
