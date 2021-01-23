require "httparty"
require "nokogiri"

class Scraper
  def initialize(category)
    @category = category
    @main_html = HTTParty.get("https://www.allrecipes.com/recipes/#{@category}")
    @main_doc = Nokogiri::HTML(@main_html.body)
  end

  def recipes_links
    @main_doc.css(".card__detailsContainer-left>.card__titleLink").map { |link| link["href"] }
  end

  def recipe_card
    @recipe_html = HTTParty.get("#{link}")
    @recipe_doc = Nokogiri::HTML(@recipe_html.body)
  end

  def recipes_grid(titles, ingredients, recipe_url)
    @recipes = []
    3.times do |i|
      @recipes[i] = {
        title: titles[i],
        ingredients: ingredients[i],
        recipe_url: recipe_url[i],
      }
    end
  end

  def recipe_info
    puts @recipe_doc
    #@titles = @recipe_doc.css("h1").map { |h1| h1.content.strip }
    #@ingredients = @recipe_doc.css(".ingredients-section>.ingredients-item>.checkbox-list>.checkbox-list-checkmark>.ingredients-item-name").map { |item| item.content.strip }
    #@recipe_url = recipes_links
    #recipes_grid(titles, ingredients, recipe_url)
    #puts @titles
    #puts @ingredients
    #puts @recipe_url
  end

  #def print_recipes
  #  puts @titles
  #  puts @ingredients
  #  puts @recipe_url
  #  @recipes.each do |recipe|
  #    puts recipe[title]
  #    puts recipe[ingredients]
  #    puts recipe[recipe_url]
  #  end
  #end
end
