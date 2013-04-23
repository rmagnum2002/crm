class CreateClientStatuses < ActiveRecord::Migration
  def change
    create_table :client_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
