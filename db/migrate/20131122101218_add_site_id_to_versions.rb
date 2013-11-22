class AddSiteIdToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :site_id, :integer
  end
end
