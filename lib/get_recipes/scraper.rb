class GetRecipes::Scraper
  
  def get_cuisine_page
    Nokogiri::HTML(open("https://www.bbcgoodfood.com/recipes/category/cuisines"))
  end
  
  def get_cuisine_attribute
    doc = self.get_cuisine_page.css('.category-item--title')
  end
  
  def make_cuisine_attribute
    get_cuisine_attribute.each do |cuisine|
      GetRecipes::Cuisines.create_cuisine(cuisine)
    end
  end
  
  #we can put the user input url straight into the below class
  
  def get_cuisine_recipe_page(url)
    @doc = Nokogiri::HTML(open("https://www.bbcgoodfood.com#{url}"))
  end
  
  def get_cuisine_recipes
    @doc.css(".node-teaser-item")
  end
  
  def make_cuisine_recipe_attribute
    get_cuisine_recipes.each do |recipe|
      GetRecipes::CuisineRecipes.create_recipe(recipe)
    end
  end
    
  
  # def scrape_cuisine_index
  #   self.get_cuisine_page.css()
  # end
  
end