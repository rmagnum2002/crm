class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :saleable_id
      t.string :saleable_type
      t.integer :user_id
      t.integer :ammount

      t.timestamps
    end
  end
end
