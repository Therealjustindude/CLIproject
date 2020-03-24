class TequilaDrink
    attr_accessor :strDrink, :idDrink
    @@all=[]

    def initialize(hash)
        # @strDrink = name
        # @idDrink = id
        
       hash.each do |k,v|
            self.send("#{k}=", v) if self.respond_to?(k)
       end
       @@all << self
       
    end

    def self.all
        @@all
    end

# # #     def list_drink_names

# # #     end

# # #     def shopping_list

# # #     end

# # #     def how_to_make

# # #     end
    
end