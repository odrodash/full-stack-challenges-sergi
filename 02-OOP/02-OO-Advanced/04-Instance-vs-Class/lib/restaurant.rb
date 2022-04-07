class Restaurant
  attr_reader :average_rating, :city

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @rate = []
  end

  def rate(new_rate)
    @rate << new_rate
    @average_rating = @rate.sum.to_f / @rate.size
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select do |restaurant|
      restaurant.city == city
    end
  end

end
