class Planet < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :user, presence: true
end
