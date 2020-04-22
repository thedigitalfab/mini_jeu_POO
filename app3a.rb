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
    return gets.chomp
end

#Welcome Message:
def welcome
    puts "--------------------------------------------------"
    puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "| Le but du jeu est d'être le dernier survivant !|"
    puts "--------------------------------------------------"
end
welcome

# Init a new game:
game = Game.new(ask_player_name)

# Fight Session:
while game.is_still_ongoing?
    # Show Players State
    game.show_players

    # Show Menu:
    game.menu

    # Ask for Action:
    user_choice = "z"
    while !user_choice.match?("[as0-#{game.enemies.length-1}]")
        user_choice = ask_player_action
    end

    # Do chosen Action:
    game.menu_choice(user_choice)

    # Enemies turn:
    game.enemies_attack
end
# End Game Message:
game.end