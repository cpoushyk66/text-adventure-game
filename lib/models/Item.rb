class Item

    attr_reader :name, :worth, :effect

    def initialize(name = "item", worth = 0, effect = nil)
        @name = name
        @worth = worth
        @effect = effect
    end


end