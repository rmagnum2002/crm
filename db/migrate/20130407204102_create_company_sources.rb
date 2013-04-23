class CreateCompanySources < ActiveRecord::Migration
  def change
    create_table :company_sources do |t|
      t.string :name

      t.timestamps
    end
  end
end
