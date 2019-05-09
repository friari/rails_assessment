class Review < ApplicationRecord
  belongs_to :user
  belongs_to :mentor

  def blank_stars
    5 - rating.to_i
  end
end
