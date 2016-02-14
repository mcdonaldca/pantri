class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.boolean :vegtable_serving 
      t.boolean :fruit_serving 
      t.boolean :grain_serving 
      t.boolean :protein_serving 
      t.boolean :dairy_serving 

      t.timestamps null: false
    end
  end
end
