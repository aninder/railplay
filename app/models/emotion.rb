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

class Emotion < ActiveRecord::Base
  belongs_to :emotionable, polymorphic:true, counter_cache: :emotion_count
  before_create :inc_counter

  def inc_counter()
    record = self
    Reply.increment_counter(:like_count,record.emotionable_id) if record.emotionable_type == 'Reply' && record.emotion == 'like'
    Comment.increment_counter(:like_count,record.emotionable_id) if record.emotionable_type == 'Comment' && record.emotion == 'like'

    Reply.increment_counter(:dislike_count,record.emotionable_id) if record.emotionable_type == 'Reply' && record.emotion == 'dislike'
    Comment.increment_counter(:dislike_count,record.emotionable_id) if record.emotionable_type == 'Comment' && record.emotion == 'dislike'
  end
end
