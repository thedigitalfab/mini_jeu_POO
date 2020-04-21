class Player
    attr_reader :life_points
    attr_accessor :name

    # ascii_art = "
    #             .I.
    #            / : \
    #            |===|
    #            >._.<
    #        .=-<     >-=.
    #       /.'`(`-+-')'`.\
    #     _/`.__/  :  \__.'\_
    #    ( `._/\`. : .'/\_.' )
    #     >-(_) \ `:' / (_)-<
    #     | |  / \___/ \  | |
    #     )^( | .' : `. | )^(
    #    |  _\|`-._:_.-'| \  |
    #    "-<\)| :  |  : |  "-"
    #      (\\| : / \ : |
    #        \\-:-| |-:-')
    #         \\:_/ \_:_/
    #         |\\_| |_:_|
    #         (;\\/ \__;)
    #         |: \\  | :|
    #         \: /\\ \ :/
    #         |==| \\|==|
    #        /v-'(  \\`-v\
    #       // .-'   \\. \\
    #       `-'       \\`-'
    #                  \|
    #             "

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        if @life_points > 0
            puts "#{@name} a #{@life_points} points de vie"
        else
            puts "#{@name} a été tué!"
        end
    end

    def gets_damage(damage_received)
        unless damage_received > @life_points
            @life_points -= damage_received
        else
            @life_points = 0
            return "#{@name}, t'es dead gros!"
        end
    end

    def attacks(player)
        puts "#{self.name} attaque #{player.name}!"
        infliged_damage = compute_damage
        puts "#{self.name} inflige #{infliged_damage} pts de degats à #{player.name}!"
        player.gets_damage(infliged_damage)
    end

    def reset
        @life_points = 10
    end

    private

    def compute_damage
        return rand(1..6)
    end
end