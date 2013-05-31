class CreateCompanyBranches < ActiveRecord::Migration
  def change
    create_table :company_branches do |t|
      t.string :name
      t.string :name_ro
      t.string :name_ru

      t.timestamps
    end
  end
end
