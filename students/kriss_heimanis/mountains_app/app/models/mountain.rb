# == Schema Information
#
# Table name: mountains
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :text
#  description :text
#  surface     :string(255)
#  height      :float
#  distance    :float
#  grade       :float
#  record      :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Mountain < ActiveRecord::Base
  attr_accessible :name, :image, :description, :surface, :height, :distance, :grade, :record
end
