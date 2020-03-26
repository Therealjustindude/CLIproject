class TequilaDrink
    attr_accessor :strDrink, :idDrink, :strInstructions, :strIngredient
    @@all=[]

    def initialize(hash)
        self.set_attributes(hash)
       @@all << self 
    end

    def set_attributes(hash)
        hash.each do |k,v|
             self.send("#{k}=", v) if self.respond_to?(k)
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

    

    # def self.shopping_list

    # end

    # def self.how_to_make
    #     binding.pry
    #     self.all.select {|k| k.strInstructions}
    # end
    
end