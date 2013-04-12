class AddResultIdAndResultDateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :result_id, :integer
    add_column :comments, :result_date, :datetime
  end
end
