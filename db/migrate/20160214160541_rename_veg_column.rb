class RenameVegColumn < ActiveRecord::Migration
  def change
    remove_column :users, :vegetable_serv_goal
    add_column :users, :vegetables_serv_goal, :integer
  end
end
