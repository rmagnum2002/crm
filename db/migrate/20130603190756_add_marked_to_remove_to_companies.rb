class AddMarkedToRemoveToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :marked_to_remove, :boolean, default: false
  end
end
