class AddCurrentUserAndEmployeerToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer
    add_column :events, :employee_id, :integer
  end
end
