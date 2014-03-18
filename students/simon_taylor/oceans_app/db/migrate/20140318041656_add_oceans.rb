class AddOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      # t.string :image_url
      t.integer :area
      t.integer :avg_depth
      t.integer :greatest_depth
      t.string :where_deepest
    end
  end
end
