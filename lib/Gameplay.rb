require_relative "./Player.rb"
require_relative "./Enemy_Data.rb"
require "pry"


enemy = nil

#player
player = Player.new("Adventurer", 30, 30, 5, [$spell_list[:fire_spell], $spell_list[:water_blast]], 100, nil)

#handle responses
def start_battle(player)
    puts
    enemy = $enemy_list[$enemy_list.keys.sample]
    puts "#{enemy.name} will be your enemy!"
    enemy.show_enemy
    turn = 0
    battle_over = false
    while !battle_over
        puts
        puts "----TURN: #{turn += 1}----"
        puts "What will you do, #{player.name}"
        battle_res = gets.chomp.downcase
        puts
        case battle_res
        when "cast spell"
            current_spell = player.spells.sample
            puts "#{player.name} casts #{current_spell.name} on #{enemy.name}!"
            player.cast_spell(enemy, current_spell)
            enemy.show_enemy
        when "run away"
            battle_over = true
            puts "Ran away!"
        else            
        end

        if (enemy.alive)
            current_spell = enemy.spells.sample
            puts "#{enemy.name} casts #{current_spell.name} on #{player.name}!"
            enemy.cast_spell(player, current_spell)
            player.show_player
        else
            puts "#{enemy.name} has died!"
            player.collect_loot(enemy.drop_loot)
            player.show_player
            puts "Fight another enemy? y/n"
            res = gets.chomp.downcase
            if res == "n"
                battle_over = true
            else
                start_battle(player)
                battle_over = true
            end

        end
    end
end

exit_game = false

while (!exit_game)
    puts `clear`
    player.show_player
    continue = true;
    while (continue)
        puts "#{player.name}, what will you do?"
        response = gets.chomp.downcase
        case response
        when "sleep"
            player.rest
            continue = false
        when "battle"
            start_battle(player)
            continue = false
        when "leave"
            exit_game = true
            continue = false
        else
            puts "Unknown Command!"
        end
    end
end
