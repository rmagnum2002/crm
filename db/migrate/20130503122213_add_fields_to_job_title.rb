class AddFieldsToJobTitle < ActiveRecord::Migration
  def change
    add_column :job_titles, :job_title_ro, :string
    add_column :job_titles, :job_title_ru, :string
  end
end
