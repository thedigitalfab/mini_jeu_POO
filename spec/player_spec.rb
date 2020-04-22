require_relative '../lib/player'

# initialize
describe "Player" do
    context "When testing the Player class" do
        it "initialize method should return a Player object" do
            expect(Player.new("josianne")).to be_kind_of(Player)
            expect(Player.new("josianne")).to respond_to(:show_state)
            expect(Player.new("josianne")).to respond_to(:gets_damage)
            expect(Player.new("josianne")).to respond_to(:attacks)
            expect(Player.new("josianne")).to_not respond_to(:compute_damage)
        end

        it "accessors should return" do
            player_1 = Player.new("Josianne")
            expect(player_1).to have_attributes(name: "Josianne")
            expect(player_1).to have_attributes(life_points: 10)
            
            player_1.gets_damage(3)
            expect(player_1).to have_attributes(life_points: 7)

            player_1.gets_damage(3)
            expect(player_1).to have_attributes(life_points: 4)

            player_2 = Player.new("Jose")
            expect(player_2).to have_attributes(name: "Jose")
            expect(player_2).to have_attributes(life_points: 10)

            player_2.gets_damage(2)
            expect(player_2).to have_attributes(life_points: 8)

            player_2.gets_damage(3)
            expect(player_2).to have_attributes(life_points: 5)
        end

        it "show_state method should give Player state" do
            player_1 = Player.new("Josianne")
            expect(player_1.show_state).to eq("Josianne a 10 points de vie")

            player_1.gets_damage(10)
            expect(player_1.show_state).to eq("Josianne a été tué!")
        end

        it "gets_damage method should inflict damage to self" do
            player_1 = Player.new("Josianne")
            expect(player_1.gets_damage(3)).to eq(7)
            expect(player_1.life_points).to eq(7)
            expect(player_1.gets_damage(2)).to eq(5)
            expect(player_1.life_points).to eq(5)
            expect(player_1.gets_damage(5)).to eq(0)
            expect(player_1.life_points).to eq(0)

            player_1 = Player.new("Josianne")
            expect(player_1.gets_damage(10)).to eq(0)
            expect(player_1.life_points).to eq(0)

            player_1 = Player.new("Josianne")
            expect(player_1.gets_damage(20)).to eq(0)
            expect(player_1.life_points).to eq(0)
        end

        it "attacks method should inflict damage to given player" do
            player_1 = Player.new("Josianne")
            player_2 = Player.new("Jose")
            # TODO: Test
        end

        it "compute_damage method should return integer in range [0-6]" do
            player_1 = Player.new("Josianne")
            expect(player_1.send(:compute_damage)).to be_between(1,6).inclusive
        end
    end
end
