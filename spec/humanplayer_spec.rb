require_relative '../lib/humanplayer'

describe "HumanPlayer" do
    context "When testing Human Player class" do
        it "initialize method should return a Player object" do
            #expect(Player.new("Michel")).to be_instance_of(HumanPlayer)
            expect(HumanPlayer.new("Michel")).to be_instance_of(HumanPlayer)
            expect(HumanPlayer.new("Michel")).to be_kind_of(Player)
            expect(HumanPlayer.new("Michel")).to respond_to(:show_state)
            expect(HumanPlayer.new("Michel")).to respond_to(:gets_damage)
            expect(HumanPlayer.new("Michel")).to respond_to(:attacks)
            expect(HumanPlayer.new("Michel")).to respond_to(:search_weapon)
            expect(HumanPlayer.new("Michel")).to respond_to(:search_health_pack)
            expect(HumanPlayer.new("Michel")).to_not respond_to(:compute_damage)
        end

        it "accessors should return" do
            player_1 = HumanPlayer.new("Michel")
            expect(player_1).to have_attributes(name: "Michel")
            expect(player_1).to have_attributes(life_points: 100)
            expect(player_1).to have_attributes(weapon_level: 1)
        end

        it "search_weapon method should run for a new Weapon" do
            player_1 = HumanPlayer.new("Michel")
            # TODO: Test
        end

        it "search_health_pack method should run for a Health Pack" do
            player_1 = HumanPlayer.new("Michel")
            # TODO: Test
        end

        it "compute_damage method should return integer in range [0-6]" do
            player_1 = HumanPlayer.new("Michel")
            expect(player_1.send(:compute_damage)).to be_between(1,6).inclusive
            10.times do
                player_1.search_weapon
                expect(player_1.send(:compute_damage)).to be_between(player_1.weapon_level,6 * player_1.weapon_level).inclusive
            end
        end
    end
end