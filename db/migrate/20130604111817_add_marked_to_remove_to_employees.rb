class AddMarkedToRemoveToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :marked_to_remove, :boolean, default: false
  end
end
