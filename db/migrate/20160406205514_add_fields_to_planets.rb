class AddFieldsToPlanets < ActiveRecord::Migration
  def change
    add_column :planets, :diameter_in_km, :integer, default: 0
    add_column :planets, :moons, :integer, default: 0
    add_column :planets, :min_temp_in_c, :integer, default: 0
    add_column :planets, :max_temp_in_c, :integer, default: 0
  end
end
