class AddGoalsToUser < ActiveRecord::Migration
  def change
    add_column :users, :vegetable_serv_goal, :integer
    add_column :users, :fruits_serv_goal, :integer
    add_column :users, :protein_serv_goal, :integer
    add_column :users, :grains_serv_goal, :integer
    add_column :users, :dairy_serv_goal, :integer
  end
end
