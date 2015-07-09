class Planet < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :user, presence: true

  include PgSearch
  pg_search_scope :search,
    :against => :name,
    :using => {
      :tsearch => {:prefix => true}
    }
end
