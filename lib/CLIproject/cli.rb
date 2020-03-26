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
        find_obj_w_input
        # puts "Here is your shopping list"
        # TequilaDrink.shopping_list
        # puts "enter 1 for instructions or exit to go shopping"
        # input = gets.chomp
        # if input.to_i  == 1
        #     get_instructions
        # elsif input.downcase == "exit"
        #     puts "Tequila may not be the answer but it's worth a shot!"
        # end
        # welcome
        get_instructions

    end

    def find_obj_w_input
        tequila_obj=TequilaDrink.all[@input - 1]
        API.tequila_by_id(tequila_obj)
    end

    def get_instructions
        tequila_obj=TequilaDrink.all[@input - 1]
        tequila_obj.strInstructions
        
    end

    def get_shopping_list

    end

    

   
end