class TequilaDrink
    attr_accessor :strDrink, :idDrink, :strInstructions, :strIngredients
    @@all=[]

    def initialize(hash)
        @strIngredients = []
        self.set_attributes(hash)
       @@all << self 
    end

    def set_attributes(hash)
        hash.each do |k,v|
            if self.respond_to?(k)
                self.send("#{k}=", v)
            elsif k.include? "strIngredient"
                @strIngredients << v
                @strIngredients.compact!
            end
        end
     end


    def self.all
        @@all
    end

    def self.list_drink_names
        self.all.each.with_index(1) do |obj, idx|
            puts "#{idx}. #{obj.strDrink}"
        end
    end

    
end