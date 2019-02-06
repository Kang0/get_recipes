class GetRecipes::Cuisines
  attr_accessor :name, :recipes, :recipe_attributes, :url
  
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
    @recipes = recipes
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end
