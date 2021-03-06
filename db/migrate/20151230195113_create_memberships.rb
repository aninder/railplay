class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, index: true, foreign_key: {on_delete: :nullify }
      t.references :role, index: true, foreign_key: true
      t.references :org, index: true, foreign_key: true
    end
  end
end
