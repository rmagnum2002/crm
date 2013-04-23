ActiveAdmin.register State do
  menu :parent => "Settings", :label => proc{ I18n.t("states") }
end
