# spec/recipes_scraper_spec.rb
require_relative '../lib/menu.rb'
require_relative '../lib/recipes.rb'

describe Menu do
  describe '#validator' do
    it 'verifies if the input is a number returns true' do
      selection = 3
      expect(selection.is_a?(Numeric)).to eql true
    end
    it 'verifies if the input is not a number returns false' do
      selection = 'd'
      expect(selection.is_a?(Numeric)).to eql false
    end

    it 'verifies if the input is between 1 and 10 returns true' do
      selection = 5
      expect(selection.between?(1, 10)).to eql true
    end
    it 'verifies if the input is not between 1 and 10 returns false' do
      selection = 11
      expect(selection.between?(1, 10)).to eql false
    end
  end
end

describe Recipes do
  describe '#initialize' do
    it 'creates a new instance for the recipes class' do
      recipes = Recipes.new(1)
      expect(recipes).to be_a(Recipes)
    end
  end
end
