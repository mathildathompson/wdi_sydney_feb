class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
        t.string :name
        t.float :volume
        t.float :depth
        t.float :ordinal
    end
  end
end
