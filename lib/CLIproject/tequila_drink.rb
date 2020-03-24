class TequilaDrink
    attr_accessor :name, :ingredients, :instructions
    @@all=[]

    def initialize(name, ingredients, instructions)
        @name = name
        @ingredients = ingredients
        @instructions = instructions
        @@all << self
    end

    def self.all
        @@all
    end

    def list_drink_names

    end

    def shopping_list

    end

    def how_to_make
        
    end
    
end