class GetRecipes::Scraper
  
  def get_cuisine_page
    Nokogiri::HTML(open(https://www.bbcgoodfood.com/recipes/category/cuisines))
    binding.pry
  end
  
  def scrape_cuisine_index
    self.get_cuisine_page.css()
  end
  
end