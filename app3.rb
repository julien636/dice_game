require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

game1=Game.new

game1.launch_battle

game1.show_players
  
while game1.is_still_ongoing?
  i=0
  puts "\n"
  puts "--------MANCHE #{i}--------"
  puts "\n"
  game1.new_player_in_sight

  game1.menu

  game1.menu_choice
    
  game1.enemy_attack
  i=i+1
end

game1.win?

binding.pry