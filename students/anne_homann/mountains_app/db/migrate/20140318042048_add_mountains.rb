class AddMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.text :range
      t.text :image
      t.integer :elevation
      t.timestamps
    end

  end
end
