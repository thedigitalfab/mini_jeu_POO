require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/humanplayer'

# Method - Ask for Human Player Name:
def ask_player_name
    puts "Quel est le nom du joueur ?"
    print "> "
    name = gets.chomp
    return name
end

# Method - Ask for Human Player Action:
def ask_player_action
    puts "Que voulez vous faire ?"
    print "> "
    action = gets.chomp
    return action
end

# Welcome Message:
puts "--------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "--------------------------------------------------"

# Create Human Player:
player = HumanPlayer.new(ask_player_name)

# Create Bot Players:
ennemies = [Player.new("Josiane"),Player.new("José")]

# Fight session:
while player.life_points > 0 && (ennemies[0].life_points > 0 || ennemies[1].life_points > 0)
    # Show Human Player state:
    player.show_state

    # Show Menu:
    puts "Quelle action veux-tu effectuer ?"
    puts "-----"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "----"
    puts "attaquer un joueur en vue :"
    print "0 - "
    puts "#{ennemies[0].show_state}"
    print "1 - "
    puts "#{ennemies[1].show_state}"

    # Get user choice:
    user_choice = "z"
    while !user_choice.match?("[as01]")
        user_choice = ask_player_action
    end

    # Do chosen action
    puts "tu as choisi: #{user_choice}"
    puts "#{user_choice.is_a? String}"
    case user_choice
    when "a"
        player.search_weapon
    when "s"
        player.search_health_pack
    when "0"
        player.attacks(ennemies[0])
    else
        player.attacks(ennemies[1])
    end

    # Ennemies' turn:
    puts "Les autres joueurs t'attaquent !"
    ennemies.each do |ennemy|
        unless ennemy.life_points == 0
            ennemy.attacks(player)
        end
    end

end

# End Game Message:
if player.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu !"
end
