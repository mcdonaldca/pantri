class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :calorie_goal
      t.integer :protein_goal
      t.integer :carbs_goal
      t.integer :fiber_goal
      t.integer :sugars_goal
      t.integer :fat_goal
      t.integer :sodium_goal

      t.timestamps null: false
    end
  end
end
