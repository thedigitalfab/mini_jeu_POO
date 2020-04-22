class Player
    attr_reader :life_points
    attr_accessor :name

    def initialize(name, life = 10)
        @name = name
        @life_points = life
    end

    def show_state
        if @life_points > 0
            #puts "#{@name} a #{@life_points} points de vie"
            return "#{@name} a #{@life_points} points de vie"
        else
            #puts "#{@name} a été tué!"
            return "#{@name} a été tué!"
        end
    end

    def gets_damage(damage_received)
        unless damage_received > @life_points
            return @life_points -= damage_received
        else
            # @life_points = 0
            # return "#{@name}, t'es dead gros!"
            return @life_points = 0
        end
    end

    def attacks(player)
        puts "#{self.name} attaque #{player.name}!"
        infliged_damage = compute_damage
        player.gets_damage(infliged_damage)
        puts "#{self.name} inflige #{infliged_damage} pts de degats à #{player.name}!"
    end

    private

    def compute_damage
        return rand(1..6)
    end
end