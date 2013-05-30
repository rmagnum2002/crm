class AddFieldsToOrganizationalForm < ActiveRecord::Migration
  def change
    add_column :organizational_forms, :name_ro, :string
    add_column :organizational_forms, :name_ru, :string
  end
end
