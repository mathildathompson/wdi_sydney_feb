# == Schema Information
#
# Table name: oceans
#
#  id      :integer          not null, primary key
#  name    :string(255)
#  volume  :float
#  depth   :float
#  ordinal :float
#

class Ocean < ActiveRecord::Base
    attr_accessible :name, :volume, :depth, :ordinal
end
