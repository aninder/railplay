# == Schema Information
#
# Table name: camels
#
#  id          :integer          not null, primary key
#  name        :string
#  age         :integer
#  description :text             default("koko")
#

class Camel < ActiveRecord::Base
end
