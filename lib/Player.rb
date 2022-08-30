
class Player

    attr_reader :name, :max_hp, :max_mp, :alive, :spells, :drops
    attr_accessor :armor, :xp, :current_hp, :current_mp

    def initialize(name = "Enemy", max_hp = 10, max_mp = 0, armor = 0, spells = [], xp = 0, inventory = [])
        @name = name
        @max_hp = max_hp
        @max_mp = max_mp
        @armor = armor
        @spells = spells
        @xp = xp
        @inventory = inventory
        
        @current_mp = max_mp
        @current_hp = max_hp
        @alive = true;
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

        if (@current_mp >= spell.cost)
            target.take_damage(spell.damage)
            @current_mp -= spell.cost
            spell.use_effect(target)

            # if !target.alive
            #     collect_loot(target.drop_loot)
            # end
        else
            puts "Not enough mana!"
        end
    end

    #Health and Damage Methods

    def rest
        self.current_hp = self.max_hp
        self.current_mp = self.max_mp
    end

    def heal(health)
        @current_hp += health
        
        if (@current_hp > @max_hp)
            @current_hp = @max_hp
        end

    end

    def take_damage(damage)
        @current_hp -= (damage - @armor)
        puts "#{self.name} lost #{damage} health!"
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
       @xp += loot[:xp]
       loot[:drops].each do |item|
        @inventory << item
       end
    end

    def show_inventory
        puts "Inventory"
        if @inventory != nil
            @inventory.each do |item|
                puts "-#{item.name}"
            end
        else
            puts "-empty"
        end
    end

    def show_player
        puts "-------------------"
        puts "Name: #{@name}"
        puts "Health: #{@current_hp} / #{@max_hp}"
        puts "Mana: #{@current_mp} / #{@max_mp}"
        puts "Xp: #{@xp}"
        puts "Armor: #{@armor}"
        puts "Spells:"
        @spells.each do |spell|
            puts "-#{spell.name}"
        end
        show_inventory
        puts "-------------------"
    end
end