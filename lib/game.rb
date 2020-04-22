class Game
    attr_accessor :human_player, :enemies
    
    # Init a new Game:
    def initialize(name, nb_enemies = 25)
        @enemies = []
        # Create Human Player:
        @human_player = HumanPlayer.new(name)
        # Create Bot Players:
        nb_enemies.times do |i|
            @enemies.insert(-1, Player.new("bot#{i}"))
        end
    end

    # Show Player State
    def show_players
        # qui va afficher:
        @human_player.show_state
        #2) le nombre de joueurs "bots" restant
        @enemies.each do |enemy|
            enemy.show_state
        end
    end

    # Show Action Menu:
    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts "-----"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner "
        puts "----"
        puts "attaquer un joueur en vue :"
        puts ""
        puts ""
        @enemies.each do |enemy|
            print "#{@enemies.find_index(enemy)} - "
            print "#{enemy.show_state}"
        end
    end

    # Do chosen Action:
    def menu_choice(choice)
        case choice
        when "a"
            @human_player.search_weapon
        when "s"
            @human_player.search_health_pack
        else
            @human_player.attacks(@enemies[choice.to_i])
            if @enemies[choice.to_i].life_points <= 0
                kill_player(enemy)
            end
        end
    end

    # Enemies attack
    def enemies_attack
        puts "Les autres joueurs t'attaquent !"
        @enemies.each do |enemy|
            if enemy.life_points > 0
                enemy.attacks(@human_player)
            else
                kill_player(enemy)
            end
        end
    end
 
    # Game still running ?:
    def is_still_ongoing? # Private Method ?
        @human_player.life_points > 0 && !enemies.empty? ? true : false
    end
    
    def end
        if @human_player.life_points > 0
            puts "BRAVO ! TU AS GAGNE !"
        else
            puts "Loser ! Tu as perdu !"
        end
    end

    private

    # Remove Dead enemies
    def kill_player(player)
        @enemies.delete(player)
    end

end