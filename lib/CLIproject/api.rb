class API

    def self.tequila_drinks
        response = HTTParty.get()
        #clean up data 
        @@all= response[].map {||}
    end
    
    def self.all
        @@all
    end

end