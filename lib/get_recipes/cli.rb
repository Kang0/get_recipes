class GetRecipes::CLI
  
  def call
    @@scrape_information = GetRecipes::Scraper.new
    @@scrape_information.make_cuisine_attribute
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
      url_link = GetRecipes::Cuisines.all[user_input.to_i - 1].url
      cuisine_recipes(url_link)
    elsif user_input == "exit"
      exit_program
    else
      puts "Please type the cuisine number or type exit"
      list_cuisines
    end
  end
  
  def cuisine_recipes(url_link)
    #Once the appropriate cuisine is selected, scrape the cuisine recipe and provide all the recipes for that specific cuisine
    #input a .between?(number of recipes) and use the selected input to provide the cuisine recipe list
    #need to iterate over the given the recipes and use the input argument to select the correct recipes
    
    #need to utilize the input in order to get the correct url and start scraping the appropriate
    
    @@scrape_information.get_cuisine_recipe_page(url_link)
    @@scrape_information.make_cuisine_recipe_attribute
    
    puts "Which recipe would you like to make?"
    
    GetRecipes::CuisineRecipes.all.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name} - #{recipe.time} / #{recipe.difficulty}"
    end
    
    user_input = gets.strip.downcase
    
    if user_input.to_i.between?(1,GetRecipes::CuisineRecipes.all.count)
      url = GetRecipes::CuisineRecipes.all[user_input.to_i - 1].url
      individual_recipe(url)
    elsif user_input == "exit"
      exit_program
    elsif user_input == "list"
      list_cuisines
    else
      puts "Please select the cuisine again and input the appropriate cuisine recipe number:"
      list_cuisines
    end
  end
  
  def individual_recipe(url_link)
    #scrape the selected recipe webpage and provide the recipe information to the user
    #need to iterate over the user inputted recipe number and provide the information below
    
    GetRecipes::Recipe.ingredients.each.with_index(1) do |attributes, index|
      puts "Serving Size - #{attributes.serving_size}"
      puts "Nutrional Information:"
      puts "kcal - #{} / fat - #{} / saturates - #{} / carbs - #{} / sugars - #{} / fibre - #{} / protein - #{} / salt - #{}"
      puts "Ingredients:"
      puts "#{attributes.ingredients}"
      puts "Methods:"
      puts "#{attributes.methods}"
    end

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