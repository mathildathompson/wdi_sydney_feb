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

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
