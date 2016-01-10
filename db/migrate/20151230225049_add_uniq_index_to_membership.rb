class AddUniqIndexToMembership < ActiveRecord::Migration
  def change
    add_index(:memberships, [:org_id, :role_id, :user_id], unique: true,
              :name => "my_index", order: {org_id: :desc, role_id: :desc, user_id: :desc})
  end
end
