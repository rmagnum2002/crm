class CreateOrganizationalForms < ActiveRecord::Migration
  def change
    create_table :organizational_forms do |t|
      t.string :name

      t.timestamps
    end
  end
end
