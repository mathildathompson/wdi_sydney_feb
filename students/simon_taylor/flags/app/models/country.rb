# == Schema Information
#
# Table name: countries
#
#  id            :integer          not null, primary key
#  abbreviation  :string(255)
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  north_america :boolean          default(FALSE)
#

class Country < ActiveRecord::Base
  attr_accessible :abbreviation
  attr_accessible :name
  attr_accessible :north_america
end
