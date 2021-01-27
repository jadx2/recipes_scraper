# frozen_string_literal: true

require_relative './styles'

class Menu
  def print_menu
    options = ['Breakfast and Brunch', 'Lunch', 'Dinners', 'Appetizer and Snacks', 'Breads', 'Desserts', 'Drinks',
               'Salads', 'Side Dishes', 'Soups and Stews']
    options.each_with_index do |option, index|
      puts "#{COLOR_2} #{index + 1}.#{COLOR_END} #{option}"
    end
  end
end
