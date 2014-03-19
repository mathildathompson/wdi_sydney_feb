class AddMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.text :image
      t.text :description
      t.string :surface
      t.float :height
      t.float :distance
      t.float :grade
      t.float :record
      t.timestamps
    end
  end
end
