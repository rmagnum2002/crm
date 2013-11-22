class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :host, :name, null: false
      t.string :description
      t.timestamps
    end

    %w{activities users company_branches company_sources
client_categories client_types client_statuses organizational_forms
job_titles companies countries events items admin_users sales
comments
}.each do |table|
      add_column table, :site_id, :integer
    end
  end
end
