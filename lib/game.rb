class Game 
  attr_accessor :player1, :players_left, :enemies_in_sight
  $name=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday","Hammerhead", "Great White", "Tiger","Whale", "Thresher", "Bullhead"]
  #Initalize ennemy_array and Players
  def initialize
    puts " -----------------------------------------------"
    puts "|                                               |"
    puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
    puts "|                                               |"
    puts "|-----------------------------------------------|"
    puts "|                                               |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "|                                               |"
    puts " -----------------------------------------------"
    puts "Nom du joueur?"
    player1_input=gets.chomp
    puts "\n"
    @player1=HumanPlayer.new(player1_input)
    @players_left=10
    @enemies_in_sight=[]

  
    
  end

  # Sentence when game instance created
  def launch_battle
    puts "\n"
    puts "Que le combat commence!"
    puts "\n"
  end

  # Condition for while loop (any players left?)
  def is_still_ongoing?
    if player1.life_point>0 #&& enemies_in_sight.size>0
      true
    else
      false
    end
  end

  #Remove enemy with no HP from enemies_in_sight
  def kill_player(input_user)
    @enemies_in_sight.delete(input_user)
  end

  def new_player_in_sight
    des=rand(1..6)
    if enemies_in_sight.size!=players_left
      if des >= 2 && des <= 4
        enemies_in_sight << Player.new($name.sample)
      elsif des >= 5
        if enemies_in_sight.size == 9
          enemies_in_sight << Player.new($name.sample)
          puts "Un joueur supplémentaire arrive"
          puts "\n"
        else
          2.times do enemies_in_sight << Player.new($name.sample)end
          puts "Deux joueurs supplémentaires arrivent"
          puts "\n"
        end
      else
        puts "Le joueur étant bloqué dans les toilettes, rien ne se passe"
        puts "\n"
      end  
    else
      puts "Tout les joueurs sont déjà en vue"
      puts "\n"
    end  
  end

  #Give status of players still in game
  def show_players
    puts "Il reste #{players_left} enemies"
    player1.show_state
    puts "\n"
  end

  #Text for actions choices
  def menu
    puts "Quelle action souhaites-tu effectuer : "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    i=0
    puts "Qui souhaites-tu attaquer?"
    enemies_in_sight.each do |enemy| 
      puts "#{i} - #{enemies_in_sight[i].name} qui a #{enemies_in_sight[i].life_point} points de vie" 
      i=i+1 
    end
  end

  #Action choice
  def menu_choice
    input_user=gets.chomp
    if input_user == "a"
      player1.search_weapon
    elsif input_user == "s"
      player1.search_health_pack
    elsif input_user.to_i>=0 && input_user.to_i<=enemies_in_sight.size-1
      player1.attack(enemies_in_sight[input_user.to_i])
      if enemies_in_sight[input_user.to_i].life_point<=0
        kill_player(enemies_in_sight[input_user.to_i])
      end
    else
      puts "Mauvaise touche, PAS DE BOL"
    end
  end

  #All enemy attack the user
  def enemy_attack
    if enemies_in_sight.size!=0
    puts "Les autres joueurs t'attaquent !"
    puts "\n"
    end

    enemies_in_sight.each do |enemy|  enemy.attack(player1) 
    gets.chomp
    end 
      #player1.show_state
  end

  #End of game, define if win or loose
  def win?
    if enemies_in_sight.size==0

      puts " -----------------------------------------------"
      puts "|                                               |"
      puts "|                                               |"
      puts "|                                               |"
      puts "|-------------Vous avez gagné!------------------|"
      puts "|                                               |"
      puts "|                                               |"
      puts "|                                               |"
      puts " -----------------------------------------------"
      
    else
      puts " -----------------------------------------------"
      puts "|                                               |"
      puts "|                                               |"
      puts "|                                               |"
      puts "|-------------Vous avez perdu!------------------|"
      puts "|                                               |"
      puts "|                                               |"
      puts "|                                               |"
      puts " -----------------------------------------------"
      
    end
  end
end

