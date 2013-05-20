ActiveAdmin.register SaleItem do
  menu :parent => "Settings", :label => proc{ I18n.t("sale_items") }
end
