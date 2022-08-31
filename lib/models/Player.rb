
class Player

    attr_reader :name, :alive, :spells, :drops, :strength, :intelligence, :stamina, :agility
    attr_accessor :armor, :xp, :current_hp, :current_mp, :class
    attr_accessor :max_mp, :max_hp

    def initialize(attributes)
        @name = attributes[:name]
        @class = attributes[:class]
        
        
        #stats
        @strength = 1
        @intelligence = 1
        @stamina = 1
        @agility = 1
        @armor = 0
        @spells = []
        
        @max_hp = 0
        @current_hp = max_hp
        @max_mp = 0
        @current_mp = max_mp
        #misc
        @inventory = []
        @xp = 0
        @alive = true;
    end

    def strength=(value)
        @strength = value
        self.update_stats
    end

    def intelligence=(value)
        @intelligence = value
        self.update_stats
    end

    def stamina=(value)
        @stamina = value
        self.update_stats
    end

    def agility=(value)
        @agility = value
        self.update_stats
    end


    #Stat methods
    def update_stats
        self.max_hp = self.stamina * 10
        self.max_mp = self.intelligence * 10
        self.rest
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
        if @inventory != []
            @inventory.each do |item|
                puts "-#{item.name}"
            end
        else
            puts "-empty"
        end
    end

    def show_spells
        puts "Spells"
        if self.spells != []
            self.spells.each do |spell|
                puts "-#{spell.name}"
            end
        else
            puts "-empty"
        end
    end
    def show_player
        puts "-------------------"
        puts "Name: #{@name} (#{@class})"
        puts "Health: #{@current_hp} / #{@max_hp}"
        puts "Mana: #{@current_mp} / #{@max_mp}"
        puts "Xp: #{@xp}"
        puts "Armor: #{@armor}"
        puts "Stats:"
        puts "-Strength: #{self.strength}"
        puts "-Intelligence: #{self.intelligence}"
        puts "-Stamina: #{self.stamina}"
        puts "-Agility: #{self.agility}"
        show_spells
        show_inventory
        puts "-------------------"
    end
end