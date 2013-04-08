class AddNumberEmployeesToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :number_employees, :integer
  end
end
