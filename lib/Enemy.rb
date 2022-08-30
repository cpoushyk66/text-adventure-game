
class Enemy 

    attr_reader :name, :max_hp, :max_mp, :alive, :spells, :drops
    attr_accessor :armor, :xp, :current_hp, :current_mp

    @@all = []

    def initialize(name = "Enemy", max_hp = 10, max_mp = 0, armor = 0, spells = [], xp = 0, drops = [])
        @name = name
        @max_hp = max_hp
        @max_mp = max_mp
        @armor = armor
        @spells = spells
        @xp = xp
        @drops = drops
        
        @current_mp = max_mp
        @current_hp = max_hp
        @alive = true;
        @@all << self
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

            # if !self.alive
            #     target.collect_loot(drop_loot)
            # end
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
        puts "#{self.name} lost #{damage}!"
        if (@current_hp <= 0)
            @current_hp = 0
            die
        end
    end

    #Special Methods
    def die
        @alive = false
    end

    def drop_loot
        puts self.drops
        puts self.xp
       [drops: @drops, xp: @xp]
    end

    def show_enemy
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
        puts "-------------------"
    end

    #global methods
    def self.all
        @@all
    end
end