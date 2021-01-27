require_relative "./scraper_logic"

class Recipes < Scraper
  def initialize(category)
    @category = category
    super
    titles = @doc.css(".card__title").map { |title| title.content.strip }
    descriptions = @doc.css(".card__summary").map { |summary| summary.content.strip }
    recipes_url = @doc.css(".card__detailsContainer-left>.card__titleLink").map { |link| link["href"] }
    reviews = @doc.css(".card__ratingCount").map { |review| review.content.strip }
    authors = @doc.css(".card__authorName").map { |author| author.content.strip }
    recipe_obj(titles, descriptions, recipes_url, reviews, authors)
  end
end
