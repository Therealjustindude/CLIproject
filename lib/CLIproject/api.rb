class API
    attr_accesor :drink_id

    

    def self.tequila_drinks
        response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=tequila")
        @drink_id = response["drinks"].map {|hash| hash["idDrink"]}
    end

    def self.tequila_by_id
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
        
        drink_id.each do |id|
           response = HTTParty.get("#{url} #{id}")
           @@all= response["drinks"].map do |hash|
                
           end
           
        end

    end
    
    def self.all
        @@all
    end

    

end