class GetRecipes::Recipe
  
  attr_accessor :serving_size, :nutritional, :ingredients, :methods, :cuisine_recipe
  
  @@all = []
  
  def initialize(serving_size = nil, nutritional = {}, ingredients = [], methods = [], cuisine_recipe = nil)
    @serving_size = serving_size
    @nutritional = nutritional
    @ingredients = ingredients
    @methods = methods
    @cuisine_recipe = cuisine_recipe
    @@all << self
  end
  
  def self.create_recipe_attribute(recipe, cuisine_recipe_object)
    
    nutrition_hash = {}
    ingredients_array = []
    methods_array = []
    
    recipe.css(".nutrition li").each do |nutrition|
      nutrition_hash[nutrition.css(".nutrition__label").text] = nutrition.css(".nutrition__value").text
    end
    
    recipe.css(".ingredients-list__group li").each do |ingredient|
      ingredients_array << ingredient["content"]
    end
    
    recipe.css(".method__item").each do |method|
      methods_array << method.text
    end

    self.new(
      recipe.css(".recipe-details__item--servings").text.strip,
      nutrition_hash,
      ingredients_array,
      methods_array,
      cuisine_recipe_object
      )
    
  end
  
  def self.all
    @@all
  end
  
  
end