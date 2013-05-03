class AddFieldsToCompanyBranch < ActiveRecord::Migration
  def change
    add_column :company_branches, :name_ro, :string
    add_column :company_branches, :name_ru, :string
  end
end
