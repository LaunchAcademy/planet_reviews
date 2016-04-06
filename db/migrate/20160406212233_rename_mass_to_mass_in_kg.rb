class RenameMassToMassInKg < ActiveRecord::Migration
  def change
    rename_column :planets, :mass, :mass_in_kg
  end
end
