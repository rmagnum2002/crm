class AddFieldsToClientStatus < ActiveRecord::Migration
  def change
    add_column :client_statuses, :name_ro, :string
    add_column :client_statuses, :name_ru, :string
  end
end
