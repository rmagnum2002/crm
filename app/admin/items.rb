ActiveAdmin.register Item do
  menu :parent => "Settings", :label => proc{ I18n.t("items") }
end
