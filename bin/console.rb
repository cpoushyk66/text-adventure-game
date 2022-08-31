require_relative "../config/environment.rb"

enemy = nil

#UI Displays
def display_title
    puts `clear`
    puts "------------------------"
    puts "##Welcome to Ruby Text##"
    puts "------------------------" 
end

#player

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
    
    
    ##################
    #Game Start#
    ##################
    
    display_title
    puts
    puts "Adventurer, what is your name?"
    while true
        res_name = gets.chomp
        puts "#{res_name}, are you sure? Y/N"
        if (gets.chomp.downcase == "y")
            break
        else
            puts "Well then, what is your name?"
        end
    end
    
    
    player = Player.new({name: res_name, class: "none"})

    stat_pool = 20

    while stat_pool > 0
        display_title
        puts "--------------------------"
        puts "##Player Stat Assignment##"
        puts "--------------------------"
        puts
        player.update_stats
        player.show_player
        puts
        puts "Assign Stat Points (#{stat_pool}) Remain:"
        puts "Str = Strength, Int = Intelligence, Sta = Stamina, Agi = Agility"
        case gets.chomp.downcase
        when "str"
            player.strength += 1
            stat_pool -= 1
        when "int"
            player.intelligence += 1
            stat_pool -= 1
        when "sta"
            player.stamina += 1
            stat_pool -= 1
        when "agi"
            player.agility += 1
            stat_pool -= 1
        end


    end
    
    while (!exit_game)
        display_title
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
        when "shop"
            Shop.start(player)
            continue = false
        when "leave"
            exit_game = true
            continue = false
        else
            puts "Unknown Command: #{response}"
        end
    end
end
