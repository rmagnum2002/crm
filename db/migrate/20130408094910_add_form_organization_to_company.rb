class AddFormOrganizationToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :form_organization_id, :integer
  end
end
