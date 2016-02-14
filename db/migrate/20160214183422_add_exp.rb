class AddExp < ActiveRecord::Migration
  def change
    add_column :ingredients, :exp_days, :integer, :default => -1
  end
end
