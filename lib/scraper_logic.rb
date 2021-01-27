# frozen_string_literal: true

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
      puts '-------------------------------------------------------'
    end
  end

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

class Recipes < Scraper
  def initialize(category)
    @category = category
    super
    titles = @doc.css('.card__title').map { |title| title.content.strip }
    descriptions = @doc.css('.card__summary').map { |summary| summary.content.strip }
    recipes_url = @doc.css('.card__detailsContainer-left>.card__titleLink').map { |link| link['href'] }
    reviews = @doc.css('.card__ratingCount').map { |review| review.content.strip }
    authors = @doc.css('.card__authorName').map { |author| author.content.strip }
    recipe_obj(titles, descriptions, recipes_url, reviews, authors)
  end
end

class Menu
  def print_menu
    <<-HEREDOC
    #{COLOR_2}1.#{COLOR_END}  Breakfast and Brunch | #{COLOR_2}2. #{COLOR_END} Lunch
    #{COLOR_2}3.#{COLOR_END}  Dinners              | #{COLOR_2}4. #{COLOR_END} Appetizer and Snacks
    #{COLOR_2}5.#{COLOR_END}  Breads               | #{COLOR_2}6. #{COLOR_END} Desserts
    #{COLOR_2}7.#{COLOR_END}  Drinks               | #{COLOR_2}8. #{COLOR_END} Salads
    #{COLOR_2}9.#{COLOR_END}  Side Dishes          | #{COLOR_2}10.#{COLOR_END} Soups and Stews
    HEREDOC
  end
end
