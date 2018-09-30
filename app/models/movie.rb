class Movie < ActiveRecord::Base
  def self.all_ratings
    Movie.uniq.pluck(:rating)
  end

  def self.sorted_by sort
    order(sort)
  end

  def self.include_ratings ratings_list
    where('rating IN (?)' ,ratings_list)
  end
end
