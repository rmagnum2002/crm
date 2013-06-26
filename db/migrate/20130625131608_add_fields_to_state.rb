class AddFieldsToState < ActiveRecord::Migration
  def change
    add_column :states, :name_ru, :string
    add_column :states, :name_ro, :string
  end
end
