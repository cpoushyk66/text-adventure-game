
class Player

    def initialize(name = "Enemy", max_hp = 10, mp = 0, armor = 0, spells = [], xp = 0, inventory = [])
        @name = name
        @max_hp = max_hp
        @mp = mp
        @armor = armor
        @spells = spells
        @xp = xp
        @inventory = inventory
        
        @current_hp = max_hp
        @alive = true;
    end

    #Getter Methods
    def get_name 
        @name
    end
    def get_current_hp 
        @current_hp
    end
    def get_mp 
        @mp
    end
    def get_armor 
        @armor
    end
    def get_spells 
        @spells
    end
    def get_xp 
        @xp
    end
    def get_alive
        @alive
    end

    #Setter/Adder Methods
    def set_name(name) 
        @name = name
    end
    def set_hp(hp) 
        @hp = hp
    end
    def set_mp(mp) 
        @mp = mp
    end
    def set_armor(armor) 
        @armor = armor
    end
    def set_spells(spells) 
        @spells = spells
    end
    def set_xp(xp) 
        @xp = xp
    end

    #Spell Manipulation Methods
    #Add Spell to Spells
    def add_spell(spell)
        @spell << spell
    end

    def remove_spell(spell)
        @spell -= [spell]
    end

    def cast_spell(target, spell)

        if (@mp >= spell.get_cost)
            target.take_damage(spell.get_damage)
            @mp -= spell.get_cost
            spell.use_effect(target)
        else
            puts "Not enough mana!"
        end
    end

    #Health and Damage Methods

    def heal(health)
        @current_hp += health
        
        if (@current_hp > @max_hp)
            @current_hp = @max_hp
        end

    end

    def take_damage(damage)
        @current_hp -= (damage - @armor)
        if (@current_hp <= 0)
            @current_hp = 0
            die
        end
    end

    #Special Methods
    def die
        @alive = false
    end

    def collect_loot(loot)
       @xp =+ loot[:xp]
       @drops << loot[:drops] if :drops != nil
    end

    def show_inventory
        puts "-------------------"
        puts "Inventory"
        puts @inventory
        puts "-------------------"
    end

    def show_player
        puts "-------------------"
        puts "Name: #{@name}"
        puts "Health: #{@current_hp} / #{@max_hp}"
        puts "Mana: #{@mp}"
        puts "Xp: #{@xp}"
        puts "Armor: #{@armor}"
        puts "Spells:"
        puts @spells
        show_inventory
        puts "-------------------"
    end
end