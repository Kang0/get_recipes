class GetRecipes::CLI
  
  def call
    list_cuisines
    cuisine_recipe
    individual_recipe
    exit_program
  end
  
  def list_cuisines
    #Scrape and list the various cuisine options avaialble to choose
    puts "Which cuisine would you like to make today?"
    puts "1. American"
    puts "2. British"
    puts "3. Caribbean"
    puts "4. Chinese"
    puts "5. French"
  end
  
  def cuisine_recipe
    #Once the appropriate cuisine is selected, scrape the cuisine recipe and provide all the recipes for that specific cuisine
    #input a .between?(number of recipes) and use the selected input to provide the cuisine recipe list
    user_input = gets.strip
    if input == "exit"
      exit_program
    elsif user_input.to_i.between?(1-5)
      individual_recipe(user_input.to_i)
      
      # if user_input == "1"
      #   puts "American Recipes"
      # elsif user_input == "2"
      #   puts "British Recipes"
      # elsif user_input == "3"
      #   puts "Caribbean Recipes"
      # elsif user_input == "4"
      #   puts "Chinese Recipes"
      # elsif user_input == "5"
      #   puts "French Recipes"
      end
    end
  end
  
  def individual_recipe(user_input)
    #scrape the selected recipe webpage and provide the recipe information to the user
    
    
  end
  
  def exit_program
    puts "Have a nice meal!"
  end
    
  
end