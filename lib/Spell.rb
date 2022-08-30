
class Spell

    attr_reader :name, :cost, :damage, :effect

    def initialize(name = "Spell", cost = 0, damage = 0, effect = nil)
        @name = name
        @cost = cost
        @damage = damage
        @effect = effect
    end

    #Special Methods
    def use_effect(target)
        unless (@effect == nil)
            method(@effect).call(target)
        else
            puts "No effect stored."
        end
    end
end
