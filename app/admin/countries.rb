ActiveAdmin.register Country do
  menu :parent => "Address", :label => proc{ I18n.t("countries") }
end
