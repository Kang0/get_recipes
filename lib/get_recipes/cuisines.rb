class GetRecipes::Cuisines
  attr_accessor :name, :recipes, :recipe_attributes, :url
  
  @@all = []
  
  def self.cuisine
    GetRecipes::Scraper.get_cuisine_page.each do |cuisine|
      bbc_cuisine = self.new
      bbc_cuisine.name = cuisine
      bbc_cuisine.recipes = ""
      bbc_cuisine.recipe_attributes = ""
      @@all << bbc_cuisine
    end
  end
  
  def self.all
    @@all
  end
  
end
