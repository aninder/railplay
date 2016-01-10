# == Schema Information
#
# Table name: replies
#
#  id            :integer          not null, primary key
#  comment_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  like_count    :integer          default(0)
#  dislike_count :integer          default(0)
#  emotion_count :integer          default(0)
#

class Reply < ActiveRecord::Base
  belongs_to :comment
  has_many :emotions, as: :emotionable
end
