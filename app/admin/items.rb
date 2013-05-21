ActiveAdmin.register Item do
  menu :parent => "Settings", :label => proc{ I18n.t("items") }

  show do
    attributes_table do
      row :name
      row :name_ro
      row :name_ru
    end
    panel "Sales list for #{item.name}" do
      table_for item.sale_items do
        column "Item name" do |sale_item|
          link_to sale_item.item.name, admin_item_path(sale_item.item)
        end
        column :price
        column :quantity
        column :total_price
        column "" do |sale_item|
          link_to 'sale details', admin_sale_path(sale_item.sale)
        end
      end
    end
  end
end
