ActiveAdmin.register ClientType do
  menu :parent => "Settings", :label => proc{ I18n.t("client_types") }
end
