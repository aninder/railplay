class AddCachesToComment < ActiveRecord::Migration
  def change
    add_column :comments, :like_count, :integer, default: 0
    add_column :comments, :dislike_count, :integer, default: 0
  end
end
