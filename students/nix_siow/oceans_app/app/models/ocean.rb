# == Schema Information
#
# Table name: oceans
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  image               :text
#  volume              :float
#  bordering_countries :text
#  shipping_routes     :text
#  created_at          :datetime
#  updated_at          :datetime
#

class Ocean < ActiveRecord::Base
  attr_accessible :name, :image, :volume, :bordering_countries, :shipping_routes
end
