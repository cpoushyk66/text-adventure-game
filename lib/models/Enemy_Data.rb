require_relative "./Enemy.rb"
require_relative "./Spell_Data.rb"
require_relative "./Item_Data.rb"

puts $spell_list

$enemy_list = {
    snake: Enemy.new("Snake", 5, 5, 1, [$spell_list[:water_blast]], 10, [$item_list[:broken_gem]]),
    skeleton: Enemy.new("Skeleton", 15, 15, 2, [$spell_list[:fire_spell]], 0, [$item_list[:broken_gem]]),
    dragon: Enemy.new("Dragon", 10, 10, 3, [$spell_list[:fire_spell], $spell_list[:water_blast]], 1000, [$item_list[:broken_gem]])
}