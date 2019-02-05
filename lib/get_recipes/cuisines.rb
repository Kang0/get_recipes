class GetRecipes::Cuisines
  attr_accessor :name, :recipes, :recipe_attributes
  
  @@all = ["American", "British", "Caribbean", "Chinese", "French", "Greek", "Indian", "Italian", "Japanese", "Mediterranean", "Mexican", "Moroccan", "Spanish", "Thai", "Turkish", "Vietnamese"]
  
  def self.all
    @@all
  end
  
end
