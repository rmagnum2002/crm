class ChangeAdminUserEmailIndex < ActiveRecord::Migration
  IDX_NAME = 'index_admin_users_on_email'

  def up
    remove_index :admin_users, name: IDX_NAME
    add_index :admin_users, [:site_id, :email], unique: true, name: IDX_NAME
  end

  def down
    remove_index :admin_users, name: IDX_NAME
    add_index :admin_users, :email, unique: true, name: IDX_NAME
  end
end
