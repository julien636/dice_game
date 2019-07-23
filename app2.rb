require 'bundler'
Bundler.require

# require_relative 'lib/game'
require_relative 'lib/player'


puts " -----------------------------------------------"
puts "|                                               |"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "|                                               |"
puts "|-----------------------------------------------|"
puts "|                                               |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "|                                               |"
puts " -----------------------------------------------"

#
def initialize_name
  enemy_array=[]
  puts "Nom du joueur?"
  player1_input=gets.chomp
  puts "\n"
  player1=HumanPlayer.new(player1_input)
  enemy_1=Player.new("José")
  enemy_2=Player.new("Josiane")
  enemy_array << enemy_1
  enemy_array << enemy_2

  launch_game(player1,enemy_array)
end

#Explication in app3 with def
def launch_game(player1,enemy_array)
  player1.show_state
  enemy_array.each do |enemy| enemy.show_state end
  
  puts "\n"

  puts "Que le combat commence!"
  puts "\n"
  puts player1.life_point
  
  while player1.life_point > 0 && (enemy_array[0].life_point>0 || enemy_array[1].life_point>0)

    puts "Quelle action souhaites-tu effectuer : "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    i=0
    puts "Qui souhaites-tu attaquer?"
    enemy_array.each do |enemy| 
      puts "#{i} - #{enemy_array[i].name} qui a #{enemy_array[i].life_point} points de vie" 
      i=i+1 
    end

    input_user=gets.chomp
    if input_user == "a"
      player1.search_weapon
    elsif input_user == "s"
      player1.search_health_pack
    else
      player1.attack(enemy_array[input_user.to_i])
      if enemy_array[input_user.to_i].life_point<=0
        enemy_array.delete(enemy_array[input_user.to_i])
      end
    end
    
    if enemy_array.size==0
      puts "Vous avez gagné!"
      break
    end
    
    puts "Les autres joueurs t'attaquent !"

    enemy_array.each do |enemy| if player1.life_point <=0 then puts "Tu as perdu" else enemy.attack(player1) end end
      player1.show_state
    

    if player1.life_point <=0
      puts "Vous avez perdu!"
    end
    
  end
end
initialize_name

binding.pry