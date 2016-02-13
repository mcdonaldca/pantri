class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day
      t.integer :month
      t.integer :year
      t.integer :fruits_serv
      t.integer :vegetables_serv
      t.integer :grains_serv
      t.integer :dairy_serv
      t.integer :protein_serv
      t.integer :calories
      t.integer :carbs
      t.integer :fat
      t.integer :fiber
      t.integer :protein
      t.integer :sodium
      t.integer :water
      t.timestamps null: false
    end
  end
end
