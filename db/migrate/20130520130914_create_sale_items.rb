class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :item_id
      t.integer :price
      t.integer :quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
