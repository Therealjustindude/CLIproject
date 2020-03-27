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
        puts "Here is your shopping list:"
        get_shopping_list
        puts "Enter 'instructions' too see them or 'exit' to go shopping"
        input = gets.chomp
        # if input.downcase  == "instructions"
        #    get_instructions
        # elsif input.downcase == "exit"
        #     puts "Tequila may not be the answer but it's worth a shot!" 
        # else
        #     puts "Maybe it's the Tequila but that is not a valid response. Please try again."
        # end
        # welcome
        
    end

    def find_obj_w_input
        tequila_obj=TequilaDrink.all[@input - 1]
        API.tequila_by_id(tequila_obj)
    end

    def get_instructions
        tequila_obj=TequilaDrink.all[@input - 1]
        puts tequila_obj.strInstructions
    end

    def get_shopping_list
        tequila_obj=TequilaDrink.all[@input - 1]
        array = tequila_obj.strIngredients
        array.each.with_index(1) do |ingredient, idx|
            puts "#{idx}. #{ingredient}"
        end
    end

    

   
end