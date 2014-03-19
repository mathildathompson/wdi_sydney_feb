# == Schema Information
#
# Table name: mountains
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  image        :text
#  elevation    :float
#  first_ascent :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Mountain < ActiveRecord::Base
    attr_accessible :name, :image, :elevation, :first_ascent
end
