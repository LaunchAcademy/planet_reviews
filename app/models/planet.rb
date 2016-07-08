class Planet < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :user, presence: true

  mount_uploader :photo, PlanetPhotoUploader

  def image
    if photo
      return photo.url
    else
      return "#{name.gsub(" ", "_")}.jpg"
    end
  end
end
