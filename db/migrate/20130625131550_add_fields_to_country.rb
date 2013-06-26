class AddFieldsToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :name_ru, :string
    add_column :countries, :name_ro, :string
  end
end
