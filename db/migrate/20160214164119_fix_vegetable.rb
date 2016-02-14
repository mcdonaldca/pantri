class FixVegetable < ActiveRecord::Migration
  def change
    remove_column :recipes, :vegtable_serving
    add_column :recipes, :vegetable_serving, :boolean
  end
end
