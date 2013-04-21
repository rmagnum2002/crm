class AddFieldChangesToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :field_changes, :string
  end
end
