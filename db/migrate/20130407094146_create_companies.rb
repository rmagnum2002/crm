class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.integer :responsible_id
      t.string :name
      t.integer :company_branch_id
      t.integer :company_source_id
      t.integer :client_category_id
      t.integer :client_type_id
      t.date :client_at
      t.string :phone
      t.string :fax
      t.string :email
      t.string :skype
      t.string :website
      t.string :facebook
      t.string :bank_req
      t.integer :fisc_id

      t.timestamps
    end
  end
end
