# == Schema Information
#
# Table name: oceans
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  nickname    :string(255)
#  image       :text
#  volume      :float
#  pirates     :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Ocean < ActiveRecord::Base
  attr_accessible :name, :nickname, :image, :volume, :pirates, :description
end
