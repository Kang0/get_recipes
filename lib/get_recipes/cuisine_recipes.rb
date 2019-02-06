class GetRecipes::CuisineRecipes
  
  #I want this class to have the attributes of time, difficulty, vegetarian "True or False"
  #The Scraper method would have to retrieve all the recipes from each cuisine and place it into an Array
  #or, the method will know to scrape a particualar webpage given the user's input of which cuisine they want the recipes for
  
  attr_accessor :name, :time, :difficulty, :vegetarian
  
  def self.recipes
    recipe_1 = self.new
    recipe_1.name = "Buffalo Chicken"
    recipe_1.time = "1 hour and 35 minutes"
    recipe_1.difficulty = "More Effort"
    recipe_1.vegetarian = false 
    
    recipe_2 = self.new
    recipe_2.name = "Texas BBQ Medley"
    recipe_2.time = "7 Hours"
    recipe_2.difficulty = "More Effort"
    recipe_2.vegetarian = false 
    
    [recipe_1, recipe_2]
  end
  
  
  
  
  
end