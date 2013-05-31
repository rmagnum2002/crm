class CreateJobTitles < ActiveRecord::Migration
  def change
    create_table :job_titles do |t|
      t.string :name
      t.string :name_ro
      t.string :name_ru

      t.timestamps
    end
  end
end
