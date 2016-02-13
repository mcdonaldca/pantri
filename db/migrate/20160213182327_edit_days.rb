class EditDays < ActiveRecord::Migration
  def change
    remove_column :days, :water
    add_column :days, :sugars, :integer
  end
end
