class GetRecipes::Recipe
  
  attr_accessor :serving_size, :nutritional, :ingredients, :methods
  
  def self.ingredients
    recipe = self.new
    recipe.serving_size = 4
    recipe.nutritional = {"kcal" => "4", "fat" => "5g", "saturates" => "6g", "carbs" => "10g", "sugars" => "3g", "fibre" => "2g", "protein" => "1g", "salt" => "4g"}
    recipe.ingredients = ["milk", "eggs", "flour", "chicken thighs", "salt"]
    recipe.methods = ["Tear the bread into pieces and toss in a bowl with the milk", "Meanwhile, hold a corn cob standing up in a shallow roasting tin. Using a sharp knife,", "To make the dressing, put the mayonnaise, mustard, garlic and chives in a bowl,"]
  end
  
  
end