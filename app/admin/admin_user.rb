ActiveAdmin.register AdminUser do
  menu :label => proc { I18n.t :admin_users }

  index do
    column :site if current_admin_user.id == 1
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  show do |res|
    columns_to_exclude = current_admin_user.id == 1 ? [] :  [:site_id]

    attributes_table do
      (res.class.columns.collect{|column| column.name.to_sym } - columns_to_exclude).each do |c|
        row c
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :site if current_admin_user.id == 1
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end
end
