class GetRecipes::CuisineRecipes
  
  #I want this class to have the attributes of time, difficulty, vegetarian "True or False"
  #The Scraper method would have to retrieve all the recipes from each cuisine and place it into an Array
  #or, the method will know to scrape a particualar webpage given the user's input of which cuisine they want the recipes for
  
  attr_accessor :name, :time, :difficulty, :url
  
  #using the provided url link from CLI class, we can start scraping the appropriate url to retrieve the recipe information
  
  @@all = []
  
  def self.create_recipe(recipe)
    self.new(
      recipe.css(".teaser-item__title").text.strip,
      recipe.css(".teaser-item__info-item--total-time").text.strip,
      recipe.css(".teaser-item__info-item--skill-level").text.strip,
      recipe.elements[1].children[1].values[0]
      )
  end
  
  def initialize(name = nil, time = nil, difficulty = nil, url = nil)
    @name = name
    @time = time
    @difficulty = difficulty
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end

end