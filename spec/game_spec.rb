require "./lib/game"
require "./lib/player"
require "./lib/module"

RSpec.describe Game do

    let(:player1) {Player.new("player1", "X")}
    let(:player2) {Player.new("player2", "O")}
    let(:board) {Board.new}
    let(:game) { Game.new(player1,player2,board) }
    let(:piece) { "x" }
    let(:piece2) { "o" }

    describe "#check_draw" do

        it "returns true and a message in case of draw and false in the opposite" do
            
            allow(board).to receive(:full?).and_return(true)

            expect(game.check_draw).to eq(true)
        end
    end

    describe "#check_victory" do

        it "Wins the game when the there is any winning color combination in the rows" do

            allow(board).to receive(:winning_combination?).and_return(true)

            expect(game.check_victory).to eq(true)
        end

        it "Returns false when the there is no winning color combination in the rows" do

            allow(board).to receive(:winning_combination?).and_return(false)

            expect(game.check_victory).to eq(false)
        end

    end

    describe "#check_game_over" do

        it "return true and ends the game when there is a victory or draw" do
            allow(board).to receive(:winning_combination?).and_return(true)

            expect(game.check_game_over).to eq(true)
        end

        it "return false when there is a no victory or draw" do
            allow(board).to receive(:winning_combination?).and_return(false)

            expect(game.check_game_over).not_to eq(true)
        end

    end

end