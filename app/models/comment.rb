# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  like_count    :integer          default(0)
#  dislike_count :integer          default(0)
#  emotion_count :integer          default(0)
#

class Comment < ActiveRecord::Base
  has_many :replies
  has_many :emotions, as: :emotionable
end
