class Review < ActiveRecord::Base
  RATINGS = [5, 4, 3, 2, 1]

  belongs_to :planet
  belongs_to :user

  validates :rating, inclusion: { in: RATINGS }
end
