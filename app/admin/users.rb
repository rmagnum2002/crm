ActiveAdmin.register User do
  menu :priority => 3, :label => "Users"

  index do
    column :id
    column I18n.t("active_admin.user.full_name") do |user|
      user.full_name
    end
    column :email
    column I18n.t("active_admin.user.sign_in_at") do |user|
      l user.last_sign_in_at, format: :long if user.last_sign_in_at.present?
    end
    column I18n.t("active_admin.user.role") do |user|
      user.role
    end
    default_actions
  end

  filter :email
  filter :role

  show do |user|
    attributes_table do
      row I18n.t("active_admin.user.full_name") do
        user.full_name
      end
      row :email
      row I18n.t("active_admin.user.created_at") do
        l user.created_at, format: :long
      end
      row I18n.t("active_admin.user.sign_in_at") do
        l user.last_sign_in_at, format: :long if user.last_sign_in_at.present?
      end
      row I18n.t("active_admin.user.role") do
        user.role
      end
      row I18n.t("active_admin.user.current_sign_in_ip") do
        user.current_sign_in_ip
      end
      row I18n.t("active_admin.user.last_sign_in_ip") do
        user.last_sign_in_ip
      end
    end
    panel "Sales" do
      table_for user.sales do
        column "ID" do |sale|
          sale.id
        end
        column "Ammount" do |sale|
          sale.ammount
        end
        column "Added at" do |sale|
          l sale.created_at, format: :long
        end
        column "Total Items Sold" do |sale|
          sale.sale_items.count
        end
        column '' do |sale|
          link_to "Details", admin_sale_path(sale)
        end
      end
    end
    panel "Companies added" do
      table_for user.companies do
        column "Name" do |company|
          link_to company.name, admin_company_path(company)
        end
        column "Added at" do |company|
          l company.created_at, format: :long
        end
        column "Responsible" do |company|
          responsible_admin(company.responsible_id)
        end
      end
    end
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: User::ROLES
      f.input :approved
    end
    f.actions
  end

  controller do
    # This code is evaluated within the controller class

    def update
      @user = User.find(params[:id])
      @user.update_attributes((params[:user]), as: :admin)
      redirect_to admin_user_path(@user)
    end
  end
end
