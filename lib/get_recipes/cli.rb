require "pry"

class GetRecipes::CLI
  
  def call
    list_cuisines
  end
  
  def list_cuisines
    #Scrape and list the various cuisine options avaialble to choose

    GetRecipes::Cuisines.all
    
    #ask the user to input which cuisine they want recipes for
    user_input = gets.strip.downcase
    if user_input.to_i.between?(1,5)
      cuisine_recipes(user_input.to_i)
    elsif user_input == "exit"
      exit_program
    else
      puts "Please type the cuisine number or type exit"
      list_cuisines
    end
  end
  
  def cuisine_recipes(input)
    #Once the appropriate cuisine is selected, scrape the cuisine recipe and provide all the recipes for that specific cuisine
    #input a .between?(number of recipes) and use the selected input to provide the cuisine recipe list
    #need to iterate over the given the recipes and use the input argument to select the correct recipes
    puts "Which recipe would you like to make?"
    puts "1. Buffalo Chicken"
    puts "2. Texas BBQ Medley"
    puts "3. S'mores Dip"
    puts "4. Fully Loaded Cajun Chicken Burgers"
    puts "5. Tomato, Avocado & Corn Salad With Migas & Buttermilk Dressing"
    
    user_input = gets.strip.downcase
    if user_input.to_i.between?(1,5)
      individual_recipe(user_input.to_i)
    elsif user_input == "exit"
      exit_program
    elsif user_input == "list"
      list_cuisines
    else
      puts "Please select the cuisine again and input the appropriate cuisine recipe number:"
      list_cuisines
    end
  end
  
  def individual_recipe(user_input)
    #scrape the selected recipe webpage and provide the recipe information to the user
    #need to iterate over the user inputted recipe number and provide the information below
    puts "Serving Size - 4"
    puts "Nutritional Information: "
    puts "kcal - 500"
    puts "Fat - 5g"
    puts "Ingredients:"
    puts "Buffalo Sauce"
    puts "Chicken Thighs"
    puts "Method:"
    puts "Place in Oven"
    puts "Type list to return to the Cuisine List or type exit."
    
    ind_recipe_input = gets.strip.downcase
    if ind_recipe_input == "exit"
      exit_program
    elsif ind_recipe_input == "list"
      list_cuisines
    else
      puts "Please select the cuisine again and either input exit or list"
      list_cuisines
    end
  end
  
  def exit_program
    puts "Have a nice meal!"
  end
end