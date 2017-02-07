class Planet < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :user, presence: true

  mount_uploader :photo, PlanetPhotoUploader

  def image
    filename = "#{name.gsub(" ", "_")}.jpg"
    path = "#{Rails.root}/public/images/#{filename}"
    if File.exists?(path)
      return filename
    else
      return photo.url
    end
  end
end
