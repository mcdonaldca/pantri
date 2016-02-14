class DeleteItems < ActiveRecord::Migration
  def change
    drop_table :items
    add_column :ingredients, :in_fridge, :boolean, :default => true
  end
end
