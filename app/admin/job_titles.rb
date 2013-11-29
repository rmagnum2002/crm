ActiveAdmin.register JobTitle do
  menu :parent => "Settings", :label => proc{ I18n.t("job_titles") }

  filter :name
  filter :name_ro
  filter :name_ru
  filter :created_at
  filter :updated_at
end
