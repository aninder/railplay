class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.references :category, index: true, foreign_key: true
      t.references :addressable, index: true, polymorphic:true
    end
  end
end
