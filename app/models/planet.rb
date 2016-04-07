class Planet < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :user, presence: true

  def image
    "#{name.gsub(" ", "_")}.jpg"
  end
end
