class AddFieldsToOrganizationalForm < ActiveRecord::Migration
  def change
    add_column :organizational_forms, :organizational_form_ro, :string
    add_column :organizational_forms, :organizational_form_ru, :string
  end
end
