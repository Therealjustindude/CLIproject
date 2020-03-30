class CLI
    def start
        API.tequila_drinks
        self.welcome
    end

    def welcome
        
        puts "We have a list of tequila drinks"
        puts "We will supply a shopping list and instructions"
            sleep (2)
        puts "Enter the number that interests you!"
            sleep (2)

        TequilaDrink.list_drink_names
         @input = gets.chomp.to_i 

            if @input.between?(1,24)
                find_obj_w_input
            else
             welcome
            end

        puts "Here is your shopping list:"
            get_shopping_list
            sleep (0.5)

        puts "Enter 'instructions' to see them, 'list' for Tequila drinks or 'exit' to get going"
        
            @input2 = gets.chomp.downcase 
            test_input(@input2)

        puts "Would you like to go to 'instructions', 'list' or 'exit'"
            @input3= gets.chomp.downcase
            options(@input3)

       
        
    end

    def options(input)
        if input == 'instructions'
            get_instructions
            list_or_exit
        elsif input == 'list'
            welcome
        else
            exit
        end
    end

    def list_or_exit
        puts "Would you like to go to 'list' or 'exit'"
        input= gets.chomp.downcase
        if input == 'list'
            welcome
            sleep (0.5)
        elsif input == 'exit'
            exit
        else
            invalid_entry
            sleep (0.5)
            list_or_exit
        end
    end

    def test_input(input)
        if input == "instructions"
            get_instructions
            sleep (1)
            list_or_exit
        elsif input == "list"
            welcome
            sleep (0.5)
        elsif input == "exit"
            exit
        else
            invalid_entry
            sleep (0.5)
            #need to go back to options some how
        end
    end

    def invalid_entry
        puts "invalid. try again."
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