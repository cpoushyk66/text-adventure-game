class Shop

    def self.start(player)
        loop = true
        while (loop)
           show_shop
           puts "You find yourself in front of the local shop."
           puts "Would you like to do?"
           res = gets.chomp.downcase
           
           loop = false
        end
    end

    def self.show_shop
    puts " ____________"
    puts "/-------------\\"
    puts "|--|   O   |--|"
    puts "|--|_/|_|\\_|--|"
    puts "|-------------|"
    end

end