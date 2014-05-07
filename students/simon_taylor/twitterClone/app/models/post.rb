# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
end
