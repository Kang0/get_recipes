class GetRecipes::Recipe
  
  attr_accessor :serving_size, :nutritional, :ingredients, :methods
  
  def self.ingredients
    recipe = self.new
    recipe.serving_size = 4
    recipe.nutritional = {"kcal" => "4", "fat" => "5g", "saturates" => "6g", "carbs" => "10g", "sugars" => "3g", "fibre" => "2g", "protein" => "1g", "salt" => "4g"}
    recipe.ingredients = ["milk", "eggs", "flour", "chicken thighs", "salt"]
    recipe.methods = ["Tear the bread into pieces and toss in a bowl with the milk", "Meanwhile, hold a corn cob standing up in a shallow roasting tin. Using a sharp knife,", "To make the dressing, put the mayonnaise, mustard, garlic and chives in a bowl,"]
  end
  
  def initialize(serving_size = nil, nutritional = {}, ingredients = [], methods = [])
    @serving_size = serving_size
    @nutritional = nutritional
    @ingredients = ingredients
    @methods = methods
  end
  
  def self.create_recipe_attribute(recipe)
    nutrition_hash = {}
    recipe.css(".nutrition li").each do |nutrition|
      nutrition_hash[nutrition.css(".nutrition__label").text] = nutrition.css(".nutrition__value").text
    end
    
    binding.pry
    
    # self.new(
    #   recipe.css(".recipe-details__item--servings").text.strip,
    #   nutrition_hash,
      
    #   )
    
    #serving_size - doc.css(".recipe-details__item--servings").text.strip
    #nutrition - doc.css(".nutrition")
      #will have to iterate over this and assign the key and value into a hash
    #ingredients - doc.css(".ingredients-list__group")[1].elements[0].content
      #will have to iterate over ".ingredients-list__group" starting at index 1 and then iterating over this information and collecting .elements and its content
      #then push this into an array of ingredients
    #methods - doc.css(".method__item p")
      #will have to iterate over this and push each text box into an array
    
  end
  
  
end