class CreateClientCategories < ActiveRecord::Migration
  def change
    create_table :client_categories do |t|
      t.string :name
      t.string :name_ro
      t.string :name_ru

      t.timestamps
    end
  end
end
