class GetRecipes::Scraper
  
  def self.get_cuisine_page
    doc = Nokogiri::HTML(open("https://www.bbcgoodfood.com/recipes/category/cuisines"))
    test = doc.css(".category-item--title").text.strip
    array = test.split(" ")
  end
  
  # def scrape_cuisine_index
  #   self.get_cuisine_page.css()
  # end
  
end