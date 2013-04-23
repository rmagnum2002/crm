ActiveAdmin.register ClientCategory do
  menu :parent => "Settings", :label => proc{ I18n.t("client_categories") }
end
