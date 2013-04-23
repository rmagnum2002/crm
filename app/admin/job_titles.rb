ActiveAdmin.register JobTitle do
  menu :parent => "Settings", :label => proc{ I18n.t("job_titles") }
end
