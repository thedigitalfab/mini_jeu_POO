require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Create Player 1:
player1 = Player.new("Josiane")

# Create Player 2:
player2 = Player.new("José")

# Introduce Players:
player1.show_state
player2.show_state
    
# Fight Session:
puts "Passons à l'attaque!"

counter = 1
while (player1.life_points > 0) && (player2.life_points > 0) do
    puts "Round: #{counter}"
    player1.name
    player2.name
    
    player1.attacks(player2)
    player2.show_state

    unless player2.life_points == 0
        player2.attacks(player1)
        player1.show_state
    end
    counter +=1
end

binding.pry

puts "Fin du programme"