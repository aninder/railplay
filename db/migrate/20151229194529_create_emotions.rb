class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.references :emotionable, index: true, polymorphic:true

      t.timestamps null: false
    end
  end
end
