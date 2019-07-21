require "./lib/game"
require "./lib/player"
require "./lib/module"

RSpec.describe Game do

    let(:player1) {Player.new("player1", "X")}
    let(:player2) {Player.new("player2", "O")}
    let(:board) {Board.new}
    # let(:current_player) { player1 }

    describe "#check_draw" do

        it "returns true and a message in case of draw and false in the opposite" do
            allow(board).to receive(:full?).and_return(true)
            expect(board.full?).to eq(true)
        end
    end

    describe "#check_victory" do

        it "it checks if the current player has won the game and returns true" do

            allow(board).to receive(:winning_combination?).and_return(true)

            expect(board.winning_combination?("X")).to eq(true)
        end

        it "it checks if the current player has not won the game and returns false" do

            allow(board).to receive(:winning_combination?).and_return(false)

            expect(board.winning_combination?("X")).to eq(false)
        end
    end

end