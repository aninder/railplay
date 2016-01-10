class AddLockToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :lock_version,:integer, default:0
  end
end
