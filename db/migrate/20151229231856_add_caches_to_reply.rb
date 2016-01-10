class AddCachesToReply < ActiveRecord::Migration
  def change
    add_column :replies, :like_count, :integer, default: 0
    add_column :replies, :dislike_count, :integer, default: 0
  end
end
