require_relative "./Enemy.rb"
require_relative "./Spell_Data.rb"

puts $spell_list

$enemy_list = {
    skeleton: Enemy.new("Skeleton", 15, 15, 2, [$spell_list[:fire_spell]], 0, nil),
    snake: Enemy.new("Snake", 5, 5, 1, [$spell_list[:water_blast]], 10, nil),
    dragon: Enemy.new("Dragon", 50, 50, 20, [$spell_list[:fire_spell], $spell_list[:water_blast]], 1000, nil)
}