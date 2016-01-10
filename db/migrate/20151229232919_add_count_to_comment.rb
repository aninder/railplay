class AddCountToComment < ActiveRecord::Migration
  def change
    add_column :comments, :emotion_count, :integer, default: 0
  end
end
