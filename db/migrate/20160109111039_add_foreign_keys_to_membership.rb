class AddForeignKeysToMembership < ActiveRecord::Migration
  def up
    # execute <<-SQL
    #   ALTER TABLE memberships
    #     ADD CONSTRAINT fk_memberships_users
    #     FOREIGN KEY (user_id)
    #     REFERENCES users(id)
    # SQL
    # remove_foreign_key :memberships, :users
    # add_foreign_key :memberships, :users, on_update: :nullify
    # add_foreign_key :memberships, :roles
    # add_foreign_key :memberships, :org
  end
  def down
    # execute <<-SQL
    #   ALTER TABLE memberships
    #     DROP CONSTRAINT fk_memberships_users
    # SQL
    # end
    remove_foreign_key :memberships, :users
    # remove_foreign_key :memberships, :roles
    # remove_foreign_key :memberships, :org
  end
end
