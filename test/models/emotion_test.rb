# == Schema Information
#
# Table name: emotions
#
#  id               :integer          not null, primary key
#  emotionable_id   :integer
#  emotionable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  emotion          :string
#

require 'test_helper'

class EmotionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
