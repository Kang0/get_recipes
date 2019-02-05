class GetRecipes::CLI
  
  def call
    list_cuisines
    cuisine_recipe
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
    #
    input = gets.strip
    if input == "exit"
      exit
    else
      if input == "1"
        puts "American Recipes"
      elsif input == "2"
        puts "British Recipes"
      elsif input == "3"
        puts "Caribbean Recipes"
      elsif input == "4"
        puts "Chinese Recipes"
      elsif input == "5"
        puts "French Recipes"
      end
    end
  end
  
  def exit
    puts "Have a nice meal!"
  end
    
  
end