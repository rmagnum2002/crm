ActiveAdmin.register Country do
  menu :parent => "Settings", :label => proc{ I18n.t("countries") }
end
