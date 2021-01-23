require_relative "../lib/scraper_logic.rb"

puts "Welcome to Allrecipes web scraper"
puts <<-HEREDOC
  1.  Breakfast and Brunch | 2.  Lunch
  3.  Dinners              | 4.  Appetizer and Snacks
  5.  Breads               | 6.  Desserts
  7.  Drinks               | 8.  Salads
  9.  Side Dishes          | 10. Soups and Stews
HEREDOC

valid = false
category = ""

while !valid
  puts "choose category:"
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

scraper = Scraper.new(category)
scraper.recipe_info
