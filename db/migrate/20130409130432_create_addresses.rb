class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :company_id
      t.boolean :address_type
      t.string :country_id
      t.string :state_id
      t.string :postal_code
      t.string :street
      t.string :street_number

      t.timestamps
    end
  end
end
