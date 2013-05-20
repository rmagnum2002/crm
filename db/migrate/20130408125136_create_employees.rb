class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.integer :gender_id
      t.date :birthday
      t.integer :language_id
      t.integer :company_id
      t.integer :job_title_id
      t.boolean :decision
      t.string :phone
      t.string :mobile
      t.string :simtravel
      t.string :email
      t.string :skype
      t.string :facebook
      t.date :client_date
      t.string :completion

      t.timestamps
    end
  end
end
