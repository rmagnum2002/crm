class AddFieldsToClientTypes < ActiveRecord::Migration
  def change
    add_column :client_types, :name_ro, :string
    add_column :client_types, :name_ru, :string
  end
end
