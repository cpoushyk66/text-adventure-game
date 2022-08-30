require_relative "./Enemy.rb"
require_relative "./Spell.rb"
require_relative "./Player.rb"
require "pry"

#effects
def burn(target)
    puts "#{target.get_name} is burned!"
    target.take_damage(target.get_current_hp / 2)
end

def drench(target)
    puts "Soaked the #{target.get_name}!"
end

#spells
fire_spell = Spell.new("Fire Spell", 2, 4, :burn)
water_spell = Spell.new("Water Blast", 3, 6, )

#enemies
enemies = [
    skeleton = Enemy.new("Skeleton", 15, 15, 2, [fire_spell], 0, nil),
    snake = Enemy.new("Snake", 5, 5, 1, [water_spell], 10, nil)
]
enemy = nil

#player
player = Player.new("Adventurer", 30, 30, 5, [fire_spell, water_spell], 100, nil)

#handle responses
def start_battle(enemies, player)
    enemy = enemies.sample
    puts "#{enemy.get_name} will be your enemy!"
    enemy.show_enemy

    battle_over = false
    while !battle_over
        puts "What will you do, #{player.get_name}"
        battle_res = gets.chomp.downcase
        case battle_res
        when "cast spell"
            player.cast_spell(enemy, player.get_spells.sample)
            enemy.show_enemy
        when "run away"
            battle_over = true
            puts "Ran away!"
        else
            
        end
    end
end

exit_game = false

while (!exit_game)
    puts `clear`
    player.show_player
    continue = true;

    while (continue)
        puts "#{player.get_name}, what will you do?"
        response = gets.chomp.downcase
        case response
        when "sleep"
            player.rest
        when "battle"
            start_battle(enemies, player)
            continue = false
        when "leave"
            exit_game = true
            continue = false
        else
            puts "Unknown Command!"
        end
    end
end
