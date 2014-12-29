class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name, null: false
      t.text :description
      t.string :mass
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
