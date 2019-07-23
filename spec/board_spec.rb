require "./lib/board"
require "./lib/game"


RSpec.describe Board do

    let(:board){Board.new}
    let(:good_coords) { [0,0] }
    let(:bad_coords) { [5,9] }
    let(:piece) { "x" }
    let(:piece2) { "o" }


    describe "#render" do
        it "renders the game UI to the terminal" do
            expect(board.render).not_to eq(nil)
        end

        it "Does not render the game UI to the terminal if the given array is incorrect" do
            allow(board.render).to receive(:each).and_return(nil)
            
            expect(board.render).not_to eq(true)
        end


    end

    describe "#coords_available?" do

        it "returns true if the chosen coordinates location is available" do
            expect(board.coords_available?(good_coords)).to eq(true)
        end

        it "returns false if the chosen coordinates location is not available" do

            #adding a piece to the good_coords position before testing and this is why it shows the "Piece added" message in the terminal before the test result
            board.add_piece(good_coords, piece)

            expect(board.coords_available?(good_coords)).to eq(false)
        end

    end

    describe "#valid_coords?" do
        it "returns true when the coordinates format is not nil" do
            expect(board.valid_coords?(good_coords)).not_to eq(nil)
        end

        it "returns true when the coordinates format is valid" do
            expect(board.valid_coords?(good_coords)).to eq(true)
        end

        it "returns false when the coordinates format is not valid" do
            expect(board.valid_coords?(bad_coords)).to eq(false)
        end
    end

    describe "#piece_location_valid?" do
        it "returns true when the location of the coords is valid" do
            expect(board.piece_location_valid?(good_coords)).to eq(true)
        end

        it "returns true when the location of the coords is valid and not nil" do
            expect(board.piece_location_valid?(good_coords)).not_to eq(nil)
        end

        it "returns false when the location of the coords is not valid" do
            expect(board.piece_location_valid?(bad_coords)).to eq(false)
        end
    end

    describe "#add_piece" do

        it "returns true when the coordinates are valid" do
            expect(board.add_piece(good_coords,piece)).to eq(true)
        end

        it "returns false when the coordinates are not valid" do
            expect(board.add_piece(bad_coords,piece)).to eq(false)
        end
    end

    describe "#winning_combination?" do


    # True cases:

        it "Wins the game when the board reads X X X across the top row returns true" do

            allow(board).to receive(:check_horizontal?).and_return(true)

            expect(board.winning_combination?(piece)).to eq(true)
        end

        it "Wins the game when the board reads X X X across the vertical row returns true" do

            allow(board).to receive(:check_vertical?).and_return(true)

            expect(board.winning_combination?(piece)).to eq(true)
        end

        it "Wins the game when the board reads X X X across the diagonal row returns true" do

            allow(board).to receive(:check_diagonal?).and_return(true)

            expect(board.winning_combination?(piece)).to eq(true)
        end

        it "Wins the game when the board reads O O O across the top row returns true" do

            allow(board).to receive(:check_horizontal?).and_return(true)

            expect(board.winning_combination?(piece2)).to eq(true)
        end

        it "Wins the game when the board reads O O O across the vertical row returns true" do

            allow(board).to receive(:check_vertical?).and_return(true)

            expect(board.winning_combination?(piece2)).to eq(true)
        end

        it "Wins the game when the board reads O O O across the diagonal row returns true" do

            allow(board).to receive(:check_diagonal?).and_return(true)

            expect(board.winning_combination?(piece2)).to eq(true)
        end


        #False cases:

        it "returns false if the horizontal row is not a color strike" do

            allow(board).to receive(:check_horizontal?).and_return(false)

            expect(board.winning_combination?(piece)).not_to eq(true)
        end


        it "returns false if the vertical row is not a color strike" do

            allow(board).to receive(:check_vertical?).and_return(false)

            expect(board.winning_combination?(piece)).not_to eq(true)
        end


        it "returns false if the diagonal row is not a color strike" do

            allow(board).to receive(:check_diagonal?).and_return(false)

            expect(board.winning_combination?(piece)).not_to eq(true)
        end

    end

end
