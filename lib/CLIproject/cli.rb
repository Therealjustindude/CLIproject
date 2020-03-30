class CLI
    def start
        API.tequila_drinks
        welcome_message
    end

    def welcome_message
        
        puts "We have a list of tequila drinks"
        puts "We will supply a shopping list and instructions"
            sleep (1.5)
        puts "Enter the number that interests you!"
            sleep (2)

        start_and_list_drinks
    end

    def start_and_list_drinks
        TequilaDrink.list_drink_names
        test_user_input
        get_shopping_list
        whats_next
    end
    
    def test_user_input #tests user drink selection
        @input = gets.chomp.to_i
        if @input.between?(1,24)
             find_obj_w_input
        else
            invalid_entry
            list_or_exit
        end
    end

    def whats_next 
        puts "Enter 'instructions' to see them, 'list' to see Tequila drinks again or 'exit' to get going"
            @input2 = gets.chomp.downcase 
            next_input_test(@input2)
    end

    def next_input_test(input) #tests users input for whats next 
        if input == "instructions"
            get_instructions
            sleep (1)
            list_or_exit
        elsif input == "list"
            start_and_list_drinks
            sleep (0.5)
        elsif input == "exit"
            exit
        else
            invalid_entry
            whats_next
        end
    end
   
    def list_or_exit
        puts "Would you like to go to the 'list' of tequila drinks or 'exit'"
        puts "Please enter 'list' or 'exit'"
        input= gets.chomp.downcase
        if input == 'list'
            start_and_list_drinks
            sleep (0.5)
        elsif input == 'exit'
            exit
        else
            invalid_entry
            list_or_exit
        end
    end

    def invalid_entry
        puts "Maybe it's the Tequila but im not sure what you're asking. Please try again."
        sleep (1.5)
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
        puts "Here is your shopping list:"
        tequila_obj=TequilaDrink.all[@input - 1]
        array = tequila_obj.strIngredients
        array.each.with_index(1) do |ingredient, idx|
            puts "#{idx}. #{ingredient}"
        end
    end

    

   
end