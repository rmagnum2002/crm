ActiveAdmin.register Sale do
  menu :priority => 3, :label => 'Sales'

  filter :order_number

  form do |f|
    f.inputs do
      f.input :ammount
      f.input :order_number
      f.input :sale_date
    end

    f.actions
  end

  show do
    attributes_table do
      row :ammount
      row :created_at
      row "sold by" do
        link_to sale.user.full_name, admin_user_path(sale.user)
      end
      row 'sold to' do
        sale.saleable
      end
    end

    panel 'Details' do
      table_for sale.sale_items do
        column "Item name" do |sale_item|
          link_to sale_item.item.name, admin_item_path(sale_item.item)
        end
        column :price
        column :quantity
        column :total_price
      end
    end
  end
end
