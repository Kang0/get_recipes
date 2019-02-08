class GetRecipes::CuisineRecipes
  
  #I want this class to have the attributes of time, difficulty, vegetarian "True or False"
  #The Scraper method would have to retrieve all the recipes from each cuisine and place it into an Array
  #or, the method will know to scrape a particualar webpage given the user's input of which cuisine they want the recipes for
  
  attr_accessor :name, :time, :difficulty, :url, :cuisine, :scraped_recipe
  
  #using the provided url link from CLI class, we can start scraping the appropriate url to retrieve the recipe information
  
  @@all = []
  
  def self.create_recipe(recipe, cuisine_object)
    self.new(
      recipe.css(".teaser-item__title").text.strip,
      recipe.css(".teaser-item__info-item--total-time").text.strip,
      recipe.css(".teaser-item__info-item--skill-level").text.strip,
      recipe.elements[1].children[1].values[0],
      cuisine_object
      )
  end
  
  def initialize(name = nil, time = nil, difficulty = nil, url = nil, cuisine = nil)
    @name = name
    @time = time
    @difficulty = difficulty
    @url = url
    @cuisine = cuisine
    @scraped_recipe = false
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def individual_recipe
    if @scraped_recipe
      GetRecipes::Recipe.all.select do |r|
        r.cuisine_recipe == self
      end
    else
       new_ind_recipe = GetRecipes::Scraper.new
       new_ind_recipe.get_recipe_page(self.url)
       new_ind_recipe.make_recipe_attribute(self)
       @scraped_recipe = true
       GetRecipes::Recipe.all.select do |r|
         r.cuisine_recipe == self
       end
    end
  end

end