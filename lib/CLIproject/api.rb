class API
    

    

    def self.tequila_drinks
        response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=tequila")
       
        response["drinks"].each do |arr|
     
            arr.each do |k,v|
                
                # hash={}
                # hash[k.to_sym] = v
                drink_name=""
                drink_id=0
                if k == "strDrink" 
                    drink_name= v
                elsif k == "idDrink"
                    drink_id = v
                end

                # case k
                # when "strDrink"
                #     drink_name= v
                # when "idDrink"
                #     drink_id = v
                # end
    
            end
            TequilaDrink.new(name=drink_name,id=drink_id)
        end
        binding.pry
    end

    # def self.tequila_by_id
    #     url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    # end
    
    def self.all
        @@all
    end

    

end