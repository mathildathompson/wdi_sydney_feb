class CreateOceansTable < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      t.string :nickname
      t.text :image
      t.float :volume
      t.text :pirates
      t.text :description
      t.timestamps
    end
  end
end
