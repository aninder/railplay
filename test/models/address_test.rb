# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  city             :string
#  category_id      :integer
#  addressable_id   :integer
#  addressable_type :string
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
