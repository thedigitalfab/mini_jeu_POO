require 'bundler'
Bundler.require
require_relative 'lib/player'

# Create Players:
player1 = Player.new("Josiane")
player2 = Player.new("José")

# Introduce Players:
puts player1.show_state
puts player2.show_state
    
# Fight Session:
puts "Passons à l'attaque!"

counter = 1
while (player1.life_points > 0) && (player2.life_points > 0) do
    puts "Round: #{counter}"
    player1.attacks(player2)
    puts player2.show_state

    unless player2.life_points == 0
        player2.attacks(player1)
        puts player1.show_state
    end
    counter +=1
end