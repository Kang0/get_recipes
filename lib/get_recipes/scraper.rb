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
  
  def self.get_cuisine_recipes_page
    
  end
    
  
  # def scrape_cuisine_index
  #   self.get_cuisine_page.css()
  # end
  
end