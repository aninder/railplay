# == Schema Information
#
# Table name: camels
#
#  id          :integer          not null, primary key
#  name        :string
#  age         :integer
#  description :text             default("koko")
#

require 'test_helper'

class CamelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
