class AddOrganizationalFormToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :organizational_form_id, :integer
  end
end
