require "httparty"
require "nokogiri"
require_relative "./styles"

class Scraper
  def initialize(_category)
    html = HTTParty.get("https://www.allrecipes.com/recipes/#{@category}")
    @doc = Nokogiri::HTML(html.body)
  end

  def recipes_holder
    @recipes
  end

  private

  def recipe_obj(titles, descriptions, recipes_url, reviews, authors)
    @recipes = []
    7.times do |i|
      @recipes[i] = {
        index: i,
        title: titles[i],
        description: descriptions[i],
        recipes_url: recipes_url[i],
        review: reviews[i],
        author: authors[i],
      }
    end
  end
end
