class AddOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
        t.string :name
        t.text :image
        t.float :volume
        t.text :bordering_countries
        t.text :shipping_routes
        t.timestamps
    end
  end
end
