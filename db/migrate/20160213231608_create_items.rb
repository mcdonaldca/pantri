class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :days_to_exp

      t.timestamps null: false
    end
  end
end
