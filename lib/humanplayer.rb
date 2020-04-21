require_relative 'player'

class HumanPlayer < Player
    attr_reader :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        if @life_points > 0
            puts "#{@name}: tu as maintenant #{@life_points} points de vie, et une arme de niveau #{@weapon_level}"
        else
            puts "#{@name} a ete tue!"
        end
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "tu as trouvé une arme de niveau: #{new_weapon_level}"
        if new_weapon_level > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = new_weapon_level
        else
            puts "M#@! Cette arme n'est pas meilleure que ton arme actuelle!"
        end
    end

    def search_health_pack
        case rand(1..6)
        when 1
            puts "Tu n'as rien trouvé..."
        when 2..5
            puts "Tu as trouvé un pack de 50 points de vie"
            unless @life_points + 50 > 100
                @life_points += 50
            else
                @life_points = 100
            end
        else # when 6
            puts "Tu as trouvé un pack de 80 points de vie"
            unless @life_points + 80 > 100
                @life_points += 50
            else
                @life_points = 100
            end
        end
    end

    def reset
        @life_points = 100
        @weapon_level = 1
    end

    private

    def compute_damage
        return rand(1..6) * @weapon_level
    end
end