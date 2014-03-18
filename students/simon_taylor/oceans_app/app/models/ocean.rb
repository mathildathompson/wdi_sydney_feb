# == Schema Information
#
# Table name: oceans
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  area           :integer
#  avg_depth      :integer
#  greatest_depth :integer
#  where_deepest  :string(255)
#

class Ocean < ActiveRecord::Base
  attr_accessible :name, :image_url, :area, :avg_depth, :greatest_depth, :where_deepest
end
