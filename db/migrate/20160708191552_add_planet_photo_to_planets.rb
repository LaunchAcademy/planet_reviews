class AddPlanetPhotoToPlanets < ActiveRecord::Migration
  def change
    add_column :planets, :photo, :string
  end
end
