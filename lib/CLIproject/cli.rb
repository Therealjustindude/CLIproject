class CLI
    def start
        API.tequila_drinks
        self.welcome

       
    end

    def welcome
        
        puts "We have a list of tequila drinks"
        puts "We will supply a shopping list and instructions"
        puts "Enter the number that interests you!"
        TequilaDrink.list_drink_names
        @input = gets.chomp.to_i 
        find_obj_for_api
        # puts "Here is your shopping list"
        # TequilaDrink.shopping_list
        # puts "enter 1 for instructions or exit to go shopping"
        # input = gets.chomp
        # if input.to_i  == 1
        #     TequilaDrink.instructions
        # elsif input.downcase == "exit"
        #     puts "Tequila may not be the answer but it's worth a shot!"
        # end
        # welcome

    end

    def find_obj_for_api
        tequila_obj=TequilaDrink.all[@input - 1]
        API.tequila_by_id(tequila_obj)
    end

    

   
end