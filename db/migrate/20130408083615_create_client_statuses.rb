class CreateClientStatuses < ActiveRecord::Migration
  def change
    create_table :client_statuses do |t|
      t.string :name
      t.string :name_ro
      t.string :name_ru

      t.timestamps
    end
  end
end
