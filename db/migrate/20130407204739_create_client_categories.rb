class CreateClientCategories < ActiveRecord::Migration
  def change
    create_table :client_categories do |t|
      t.string :category

      t.timestamps
    end
  end
end
