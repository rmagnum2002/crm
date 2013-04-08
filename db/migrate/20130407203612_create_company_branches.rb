class CreateCompanyBranches < ActiveRecord::Migration
  def change
    create_table :company_branches do |t|
      t.string :name

      t.timestamps
    end
  end
end
