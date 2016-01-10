class AddEmotionToEmotion < ActiveRecord::Migration
  def change
    add_column :emotions, :emotion, :string
  end
end
