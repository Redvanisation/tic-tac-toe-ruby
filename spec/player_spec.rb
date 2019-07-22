require "./lib/player"

RSpec.describe Player do

    let(:name) { "player_1" }
    let(:color) { "X" }
    let(:player) { Player.new(name, color) }


    describe "#initilize" do
        
        it "returns the name and the color of the new player" do
            expect(player.name).to eq(name)
            expect(player.color).to eq(color)
        end
    end

end
