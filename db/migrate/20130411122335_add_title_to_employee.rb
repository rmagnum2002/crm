class AddTitleToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :title, :integer
  end
end
