require_relative "./Spell.rb"

#effects
def burn(target)
    puts "#{target.name} is burned!"
    target.take_damage(target.current_hp / 2)
end

def drench(target)
    puts "Soaked the #{target.name}!"
    target.current_mp = (target.current_mp / 2)
end

def blitz(target)
    puts "#{target.name} was blitzed!"
end

$spell_list = {
    fire_spell: Spell.new("Fire Spell", 2, 4, :burn),
    water_blast: Spell.new("Water Blast", 3, 6, :drench)
}