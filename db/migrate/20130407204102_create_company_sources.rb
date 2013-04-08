class CreateCompanySources < ActiveRecord::Migration
  def change
    create_table :company_sources do |t|
      t.string :source

      t.timestamps
    end
  end
end
