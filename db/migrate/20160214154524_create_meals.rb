class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.float :servings
      t.integer :day_id

      t.timestamps null: false
    end
  end
end
