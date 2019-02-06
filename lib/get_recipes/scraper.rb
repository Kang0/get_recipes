class GetRecipes::Scraper
  
  def get_cuisine_page
    Nokogiri::HTML(open("https://www.bbcgoodfood.com/recipes/category/cuisines"))
  end
  
  def scrape_cuisine_name
    doc = self.get_cuisine_page.css('.category-item--title')
    binding.pry
  end
  
    # cuisine_name = doc.css(".category-item--title").text.strip
    # binding.pry
    # # url - doc.search(".category-item--title a").attribute("href").value
    # array = cuisine_name.split(" ")
  
  def self.get_cuisine_recipes_page
    
  end
    
  
  # def scrape_cuisine_index
  #   self.get_cuisine_page.css()
  # end
  
end