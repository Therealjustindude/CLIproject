class API
    

    

    def self.tequila_drinks
        response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=tequila")
        response["drinks"].each do |arr|
            arr.reject! {|attr| attr == "strDrinkThumb"}
                TequilaDrink.new(arr)
        end
    end

    # def self.tequila_by_id
    #     url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    # end
    
    def self.all
        @@all
    end

    

end