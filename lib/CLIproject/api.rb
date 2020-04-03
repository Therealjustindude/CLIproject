class API

    def self.tequila_drinks
        response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=tequila")
        response["drinks"].each do |arr|
            arr.reject! {|attr| attr == "strDrinkThumb"}
            TequilaDrink.new(arr)
        end
    end

    def self.tequila_by_id(tequila_obj)
        tequila_id = tequila_obj.idDrink
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
        response = HTTParty.get("#{url} #{tequila_id}")
        api_hash=response["drinks"][0]
        tequila_obj.set_attributes(api_hash)
    end
    
    def self.all
        @@all
    end

    

end