class AddCountToReply < ActiveRecord::Migration
  def change
    add_column :replies, :emotion_count, :integer, default: 0
  end
end
