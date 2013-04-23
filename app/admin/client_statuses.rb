ActiveAdmin.register ClientStatus do
  menu :parent => "Settings", :label => proc{ I18n.t("client_statuses") }
end
