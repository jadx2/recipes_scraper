require_relative './styles'

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

  def links
    ["78/breakfast-and-brunch/", "17561/lunch/", "17562/dinner/", "76/appetizers-and-snacks/", "156/bread/",
     "79/desserts/", "77/drinks/", "96/salad/", "81/side-dish/", "94/soups-stews-and-chili/"]
  end

  def validator(selection)
    if selection.is_a?(Numeric) && selection.between?(1, 10)
      true
    else
      false
    end
  end
end
