
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "get_recipes/version"

Gem::Specification.new do |spec|
  spec.name          = "get_recipes"
  spec.version       = GetRecipes::VERSION
  spec.date          = "2019-02-05"
  spec.summary       = "BBC Good Food Recipes"
  spec.description   = "Shows a list of 16 different cuisines and their specific recipes as well as how to make a specific recipe"
  spec.authors       = ["'Kevin Kang'"]
  spec.email         = 'kevinkangg@gmail.com'

  
  spec.homepage      = "https://github.com/Kang0/get_recipes"
  spec.license       = "MIT"
  
  spec.files         = ["lib/get_recipes.rb", "lib/get_recipes/cli.rb", "lib/get_recipes/cuisine_recipes.rb", "lib/get_recipes/cuisines.rb", "lib/get_recipes/recipe.rb", "lib/get_recipes/scraper.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
