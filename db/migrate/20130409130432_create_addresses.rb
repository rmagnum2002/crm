class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :company_id
      t.string :address_type
      t.string :country
      t.string :city
      t.string :postal_code
      t.string :street
      t.string :street_number
      t.string :bank_details
      t.string :fiscal_code

      t.timestamps
    end
  end
end
