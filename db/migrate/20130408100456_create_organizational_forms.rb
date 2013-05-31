class CreateOrganizationalForms < ActiveRecord::Migration
  def change
    create_table :organizational_forms do |t|
      t.string :name
      t.string :name_ro
      t.string :name_ru

      t.timestamps
    end
  end
end
