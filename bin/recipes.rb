require_relative "../lib/scraper_logic.rb"
require_relative "../lib/styles.rb"

menu = Menu.new
valid = false
category = ""

def clear
  system "clear" or system "cls"
end

puts "#{COLOR_1}WELCOME TO ALLSPICE SCRAPER#{COLOR_END}"
puts "#{COLOR_1}===========================#{COLOR_END}"
puts "\n"
puts menu.print_menu
puts "\n"

while !valid
  puts "Choose category number:"
  selection = gets.chomp.to_i
  case selection
  when 1
    category = "78/breakfast-and-brunch/"
    valid = true
  when 2
    category = "17561/lunch/"
    valid = true
  when 3
    category = "17562/dinner/"
    valid = true
  when 4
    category = "76/appetizers-and-snacks/"
    valid = true
  when 5
    category = "156/bread/"
    valid = true
  when 6
    category = "79/desserts/"
    valid = true
  when 7
    category = "77/drinks/"
    valid = true
  when 8
    category = "96/salad/"
    valid = true
  when 9
    category = "81/side-dish/"
    valid = true
  when 10
    category = "94/soups-stews-and-chili/"
    valid = true
  else
    puts "Category not found!"
  end
end

recipes = Recipes.new(category)
recipes.print_recipe
