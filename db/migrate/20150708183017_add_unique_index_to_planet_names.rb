class AddUniqueIndexToPlanetNames < ActiveRecord::Migration
  def change
    add_index :planets, :name, unique: true
  end
end
