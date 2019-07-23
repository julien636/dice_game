class Player
  attr_accessor :name, :life_point

  def initialize(name_input)
    @name=name_input 
    @life_point=10 

  end

  def show_state
    puts "#{self.name} a #{self.life_point} point de vie!"
    if life_point <= 0
      puts "#{self.name} n'a plus de point de vie"
    end
  end

  def gets_damage(damage)
    @life_point=@life_point-damage
      if life_point <= 0
        puts "#{self.name} n'a plus de point de vie"
      end
  end

  def compute_damage
    return rand(1..6)
  end

  def attack(player)
    puts "#{self.name} attaque #{player.name}."
    damage=compute_damage
    puts "#{self.name} inflige #{damage} point de dégats à #{player.name}."
    player.gets_damage(damage)
    if player.life_point > 0
      player.show_state
      
      end
      puts "\n"  
  end

end

class HumanPlayer<Player
  attr_accessor :weapon_level, :life_point

  def initialize(name_input)
    @name=name_input
    @weapon_level = 1
    @life_point=100
  
  end

  def show_state
    puts "#{self.name} a #{self.life_point} point de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_health_pack
    des=rand(1..6)
      if des >=2 && des<=5
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        @life_point=@life_point+50
        if life_point >= 50
          @life_point=100
        else
          @life_point=@life_point+50
        end
      self.show_state
      elsif des==1
        puts "Tu n'as rien trouvé"
      else
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
        if life_point > 20
          @life_point=100
        else
          @life_point=@life_point+80
        end
      self.show_state
      end
  end

  def search_weapon
    des=rand(1..6)
      if des <= @weapon_level
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      else 
        @weapon_level=des
        puts "tu as trouvé une arme de niveau #{des}"
      end
  end

end


