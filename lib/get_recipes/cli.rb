class GetRecipes::CLI
  
  def call
    list_cuisines
    cuisine_recipes
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
  
  def cuisine_recipes
    #Once the appropriate cuisine is selected, scrape the cuisine recipe and provide all the recipes for that specific cuisine
    #input a .between?(number of recipes) and use the selected input to provide the cuisine recipe list
    user_input = nil
    while user_input != "exit"
      puts "Which 'American' recipe would you like to make?"
      user_input = gets.strip.downcase
      puts "1. Buffalo Chicken"
      puts "2. Texas BBQ Medley"
      puts "3. S'mores Dip"
      puts "4. Fully Loaded Cajun Chicken Burgers"
      puts "5. Tomato, Avocado & Corn Salad With Migas & Buttermilk Dressing"
      case user_input
      when user_input.to_i.between?(1,5)
        individual_recipe(user_input)
      when "back"
        list_cuisines
      when "exit"
        exit_program
      else
        "Please type the recipe number, type back to go back to the cuisine list, or type exit."
      end
  end
  
  def individual_recipe(user_input)
    #scrape the selected recipe webpage and provide the recipe information to the user
    ind_recipe_input = nil
    while ind_recipe_input != "exit"
      ind_recipe_input = gets.strip
      
      puts "Serving Size - 4"
      puts "Nutritional Information: "
      puts "kcal - 500"
      puts "Fat - 5g"
      puts "Ingredients:"
      puts "Buffalo Sauce"
      puts "Chicken Thighs"
      puts "Method:"
      puts "Place in Oven"
      puts "Type list to return to the Cuisine List, type back to go back to 'American' recipes, or type exit."
      
      case ind_recipe_input
      when "list"
        list_cuisines
      when "back"
        cuisine_recipes
      when "exit"
        exit_program
      else
        "Please type list to return to the Cuisine List, type back to go back to 'American' recipes, or type exit."
      end
  end
  
  def exit_program
    puts "Have a nice meal!"
  end
    
  
end