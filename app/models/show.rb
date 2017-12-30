class Show < ActiveRecord::Base


  def self.highest_rating
    Show.maximum(:rating)
  end

  def self.lowest_rating
    Show.minimum(:rating)
  end

  def self.most_popular_show
    highest_rated = Show.highest_rating
    Show.find_by(rating: highest_rated)
  end

  def self.least_popular_show
    lowest_rated = Show.lowest_rating
    Show.find_by(rating: lowest_rated)
  end

  def self.ratings_sum
    Show.sum(:rating)
  end

  def self.popular_shows
    Show.all.where("rating > ?", 5)
  end

  def self.shows_by_alphabetical_order
    Show.all.order(:name)
  end
end
