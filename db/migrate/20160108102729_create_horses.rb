class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :age
      t.text :description

      t.timestamps null: false
    end
  end
end
