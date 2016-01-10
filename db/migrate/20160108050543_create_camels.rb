class CreateCamels < ActiveRecord::Migration
  def change
    create_table :camels do |t|
      t.string :name
      t.integer :age
      t.text :description, default:'koko'
    end
  end
end
