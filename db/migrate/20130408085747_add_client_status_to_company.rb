class AddClientStatusToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :client_status_id, :integer
  end
end
