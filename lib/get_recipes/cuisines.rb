class GetRecipes::Cuisines
  attr_accessor :name, :recipe_attributes, :url, :scraped_recipes
  
  @@all = []
  
  def self.create_cuisine(cuisine)
    self.new(
      cuisine.text.strip,
      cuisine.elements[0].values[0]
      )
  end
  
  def initialize(name = nil, url = nil, recipes = nil, recipe_attributes = nil)
    @name = name
    @url = url
    @recipe_attributes = recipe_attributes
    @scraped_recipes = false
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def recipes
    if @scraped_recipes
      GetRecipes::CuisineRecipes.all.select do |r|
        r.cuisine == self
      end
    else
       new_cuisine_recipe = GetRecipes::Scraper.new
       new_cuisine_recipe.get_cuisine_recipe_page(self.url)
       new_cuisine_recipe.make_cuisine_recipe_attribute(self)
       @scraped_recipes = true
       GetRecipes::CuisineRecipes.all.select do |r|
         r.cuisine == self
       end
    end
  end

  
end
