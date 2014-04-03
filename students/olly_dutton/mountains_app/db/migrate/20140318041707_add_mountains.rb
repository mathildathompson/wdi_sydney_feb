class AddMountains < ActiveRecord::Migration
  def change
     create_table :mountains do |t|
        t.string :name
        t.text :image
        t.float :elevation
        t.text :first_ascent
        t.timestamps
    end
  end
end
