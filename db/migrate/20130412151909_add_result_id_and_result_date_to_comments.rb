class AddResultIdAndResultDateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :result_id, :integer
    add_column :comments, :result_date, :date
    add_column :comments, :result_time, :string
  end
end
