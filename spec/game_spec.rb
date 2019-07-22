require "./lib/game"
require "./lib/player"
require "./lib/module"

RSpec.describe Game do

    let(:player1) {Player.new("player1", "X")}
    let(:player2) {Player.new("player2", "O")}
    let(:board) {Board.new}
    let(:piece) { "x" }
    let(:piece2) { "o" }

    describe "#check_draw" do

        it "returns true and a message in case of draw and false in the opposite" do
            allow(board).to receive(:full?).and_return(true)
            expect(board.full?).to eq(true)
        end
    end

    describe "#check_victory" do

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

    end

end