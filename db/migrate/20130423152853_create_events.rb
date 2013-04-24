class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :comment_id
      t.integer :action_id
      t.string :email
      t.datetime :event_date

      t.timestamps
    end
  end
end
