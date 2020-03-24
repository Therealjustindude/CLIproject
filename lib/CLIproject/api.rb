class API
    

    

    def self.tequila_drinks
        response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=tequila")
       
        response["drinks"].each do |arr|
            arr.reject! {|attr| attr == "strDrinkThumb"}
            arr.each do |k,v|
                hash={}
                hash[k.to_sym] = v
                
                
                
                TequilaDrink.new(hash)
                # drink_name=""
                # drink_id=0
                # case k
                # when "strDrink"
                #     drink_name= v
                # when "idDrink"
                #     drink_id = v
                # end
            end
            binding.pry
        end
       
    end

    # def self.tequila_by_id
    #     url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    # end
    
    def self.all
        @@all
    end

    

end