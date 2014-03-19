class AddMountains < ActiveRecord::Migration
  def change
  	create_table :mountains do |t|
  		t.string :name
  		t.text :image
  		t.float :height
  		t.text :bordering_countries
  	end
  end
end
