class Movie < ActiveRecord::Base
  def self.all_ratings
    hash = {}
    Movie.uniq.pluck(:rating).each do |rating|
      hash[rating] = rating
    end
    hash
  end

  def self.sorted_by sort
    order(sort)
  end

  def self.include_ratings ratings_hash
    where('rating IN (?)' ,ratings_hash.keys)
  end
end
