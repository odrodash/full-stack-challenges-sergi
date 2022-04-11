require "nokogiri"
require "open-uri"
require_relative "recipe"

class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
    @web_recipes = []
  end

  def call
    url = "https://www.allrecipes.com/search/results/?search=#{@keyword}"
    html = URI.open(url)
    doc = Nokogiri::HTML(html)

    doc.search(".card__detailsContainer").first(5).each do |element|
      title = element.search(".card__title").text.strip
      description = element.search(".card__summary").text.strip
      rating = element.search(".review-start-text").text.strip.split[1].to_f

      url = element.search(".card__titleLink").attr("href").value
      html = URI.open(url)
      recipe_doc = Nokogiri::HTML(html)
      prep_time = recipe_doc.search(".recipe-meta-item-body").text.strip.split[0].to_i

      @web_recipes << Recipe.new(title, description, rating, false, prep_time)
    end
    return @web_recipes
  end
end
