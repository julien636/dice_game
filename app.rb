require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Ask players' names
def initialize_name
  puts "Nom du premier joueur?"
  player1_input=gets.chomp
  puts "Nom du deuxième joueur?"
  player2_input=gets.chomp
  puts "\n"
  launch_game(player1_input,player2_input)
end

#Like the method name
def launch_game(player1_input,player2_input)
  player1=Player.new(player1_input)
  player2=Player.new(player2_input)
  player1.show_state
  player2.show_state
  puts "\n"

  puts "Que le combat commence!"
  puts "\n"
  while player1.life_point > 0 && player2.life_point > 0
    player2.attack(player1)
      if player1.life_point <=0
        puts "#{player2.name} a gagné"
        break
      end
    player1.attack(player2)
      if player2.life_point <=0
        puts "#{player1.name} a gagné"
        break
      end
  end
end

initialize_name

binding.pry