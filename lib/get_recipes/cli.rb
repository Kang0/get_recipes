class GetRecipes::CLI
  
  def call
    GetRecipes::Scraper.new.make_cuisine_attribute
    list_cuisines
  end
  
  def list_cuisines

    GetRecipes::Cuisines.all.each.with_index(1) do |cuisine, index|
      puts "#{index}. #{cuisine.name}"
    end
    
    puts ""
    puts "Which cuisine would you like to make today?"
     
    user_input = gets.strip.downcase
    
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
    
    cuisine.recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name} - #{recipe.time} / #{recipe.difficulty}"
    end
    
    puts ""
    puts "Which recipe would you like to make?"
    puts ""
    puts "Type the recipe number for more information, type 'list' to go back to the cuisine list, or type 'exit'"
    
    user_input = gets.strip.downcase
    
    if user_input.to_i.between?(1,GetRecipes::CuisineRecipes.all.select {|r| r.cuisine.name == cuisine.name}.count)
      cuisine_recipe = GetRecipes::CuisineRecipes.all.select {|r| r.cuisine.name == cuisine.name}[user_input.to_i - 1]
      display_individual_recipe(cuisine_recipe)
    elsif user_input == "exit"
      exit_program
    elsif user_input == "list"
      list_cuisines
    else
      puts "Type the recipe number for more information, type 'back' to go back to the cuisine recipes, type 'list' to go back to the cuisine list, or type 'exit':"
      puts ""
      display_recipes(cuisine)
    end
  end
  
  def display_individual_recipe(cuisine_recipe)
  
    show_individual_recipes(cuisine_recipe)

    puts "Type 'back' to return to the cuisine recipes', type 'list' to return to the cuisine list, or type 'exit'"
    
    ind_recipe_input = gets.strip.downcase
    
    if ind_recipe_input == "exit"
      exit_program
    elsif ind_recipe_input == "list"
      list_cuisines
    elsif ind_recipe_input == "back"
      display_recipes(cuisine_recipe.cuisine)
    else
      puts "Please select the cuisine again and either input exit or list"
      list_cuisines
    end
  end
  
  def show_individual_recipes(cuisine_recipe)
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
  end
  
  def exit_program
    puts "Have a nice meal!"
  end
end