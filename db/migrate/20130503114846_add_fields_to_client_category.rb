class AddFieldsToClientCategory < ActiveRecord::Migration
  def change
    add_column :client_categories, :name_ro, :string
    add_column :client_categories, :name_ru, :string
  end
end
