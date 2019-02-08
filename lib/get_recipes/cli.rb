class GetRecipes::CLI
  
  def call
    GetRecipes::Scraper.new.make_cuisine_attribute
    list_cuisines
  end
  
  def list_cuisines
    #Scrape and list the various cuisine options avaialble to choose

    GetRecipes::Cuisines.all.each.with_index(1) do |cuisine, index|
      puts "#{index}. #{cuisine.name}"
    end
    
    puts "Which cuisine would you like to make today?"
     
    #ask the user to input which cuisine they want recipes for
    
    user_input = gets.strip.downcase
    
    #using the user_input, we can grab the specific url to scrape
    
    if user_input.to_i.between?(1,GetRecipes::Cuisines.all.count)
      cuisine = GetRecipes::Cuisines.all[user_input.to_i - 1]
      display_recipes(cuisine)
    elsif user_input == "exit"
      exit_program
    else
      puts "Please type the cuisine number or type exit"
      list_cuisines
    end
  end
  
  def display_recipes(cuisine)
    #Once the appropriate cuisine is selected, scrape the cuisine recipe and provide all the recipes for that specific cuisine
    #input a .between?(number of recipes) and use the selected input to provide the cuisine recipe list
    #need to iterate over the given the recipes and use the input argument to select the correct recipes
    
    #need to utilize the input in order to get the correct url and start scraping the appropriate
    
    puts "Which recipe would you like to make?"
    
    cuisine.recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name} - #{recipe.time} / #{recipe.difficulty}"
    end
    
    user_input = gets.strip.downcase
    
    if user_input.to_i.between?(1,GetRecipes::CuisineRecipes.all.select {|r| r.cuisine.name == cuisine.name}.count)
      cuisine_recipe = GetRecipes::CuisineRecipes.all.select {|r| r.cuisine.name == cuisine.name}[user_input.to_i - 1]
      display_individual_recipe(cuisine_recipe)
    elsif user_input == "exit"
      exit_program
    elsif user_input == "list"
      list_cuisines
    else
      puts "Please select the cuisine again and input the appropriate cuisine recipe number:"
      list_cuisines
    end
  end
  
  def display_individual_recipe(cuisine_recipe)
    #scrape the selected recipe webpage and provide the recipe information to the user
    #need to iterate over the user inputted recipe number and provide the information below
  
    cuisine_recipe.individual_recipe.each do |ingredient|
      puts "Serving - #{ingredient.serving_size}"
      puts ""
      puts "Nutritional Information: "
      puts ""
      ingredient.nutritional.each do |nutrition, value|
        puts "#{nutrition}: #{value}"
      end
      puts ""
      puts "Ingredients: "
      puts ""
      ingredient.ingredients.each do |i|
        puts "#{i}"
      end
      puts ""
      puts "Methods: "
      puts ""
      ingredient.methods.each.with_index(1) do |method, index|
        puts "#{index}. #{method}\n"
        puts ""
      end
    end
    
    # GetRecipes::Recipe.all.each do |ingredient|
    #   puts "Serving - #{ingredient.serving_size}"
    #   puts ""
    #   puts "Nutritional Information: "
    #   puts ""
    #   ingredient.nutritional.each do |nutrition, value|
    #     puts "#{nutrition}: #{value}"
    #   end
    #   puts ""
    #   puts "Ingredients: "
    #   puts ""
    #   ingredient.ingredients.each do |i|
    #     puts "#{i}"
    #   end
    #   puts ""
    #   puts "Methods: "
    #   puts ""
    #   ingredient.methods.each.with_index(1) do |method, index|
    #     puts "#{index}. #{method}\n"
    #     puts ""
    #   end
    # end

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