# == Schema Information
#
# Table name: mountains
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  image               :text
#  height              :float
#  bordering_countries :text
#

class Mountain < ActiveRecord::Base
	attr_accessible :name, :image, :height, :bordering_countries
end
