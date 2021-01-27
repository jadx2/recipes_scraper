require 'httparty'
require 'nokogiri'
require_relative './styles'

class Scraper
  def initialize(_category)
    html = HTTParty.get("https://www.allrecipes.com/recipes/#{@category}")
    @doc = Nokogiri::HTML(html.body)
  end

  def print_recipe
    @recipes.each do |recipe|
      puts "#{COLOR_1}Recipe #{recipe[:index] + 1}: #{recipe[:title]}#{COLOR_END}"
      puts "\n"
      puts "#{COLOR_2}Summary:#{COLOR_END} #{recipe[:description]}"
      puts "#{COLOR_2}Reviews:#{COLOR_END} #{recipe[:review]}"
      puts "#{COLOR_2}Recipe URL:#{COLOR_END} #{recipe[:recipes_url]}"
      puts "#{COLOR_2}Author:#{COLOR_END} #{recipe[:author]}"
      puts "-------------------------------------------------------"
    end
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
        author: authors[i]
      }
    end
  end
end
