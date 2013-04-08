class CreateOrganizationalForms < ActiveRecord::Migration
  def change
    create_table :organizational_forms do |t|
      t.string :organizational_form

      t.timestamps
    end
  end
end
