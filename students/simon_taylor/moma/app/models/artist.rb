# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  period      :string(255)
#  nationality :string(255)
#  dob         :date
#  image       :text
#

class Artist < ActiveRecord::Base
  attr_accessible :name, :period, :nationality, :dob, :image
  has_many :works
end
