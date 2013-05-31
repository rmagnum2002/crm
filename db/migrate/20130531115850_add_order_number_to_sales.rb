class AddOrderNumberToSales < ActiveRecord::Migration
  def change
    add_column :sales, :order_number, :string
  end
end
