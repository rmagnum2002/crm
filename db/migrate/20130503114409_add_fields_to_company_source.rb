class AddFieldsToCompanySource < ActiveRecord::Migration
  def change
    add_column :company_sources, :name_ro, :string
    add_column :company_sources, :name_ru, :string
  end
end
