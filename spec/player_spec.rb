require "./lib/player"

RSpec.describe Player do

    let(:name) { "player_1" }
    let(:color) { "X" }
    let(:player) { Player.new(name, color) }
    let(:player2) { Player.new }
    
    
    describe "#initilize" do
    
        it "returns the name and the color of the new player" do
                expect(player.name).to eq(name)
                expect(player.color).to eq(color)
        end

        it "raises an error if player name or color are empty" do
            expect { player2.name }.to raise_error(ArgumentError)
            expect { player2.color }.to raise_error(ArgumentError)
        end
    end

end
