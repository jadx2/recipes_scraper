# spec/recipes_scraper_spec.rb
require_relative '../lib/scraper_logic'

describe Recipes do
  describe '#initialize' do
    it 'creates a new instance for the recipes class' do
      recipes = Recipes.new(1)
      expect(recipes).to be_a(Recipes)
    end
  end
end
