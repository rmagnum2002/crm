ActiveAdmin.register AdminUser do
  menu :label => proc { I18n.t :admin_users }

  #scope_to :current_site

  after_build do |user|
    user.site = @site
  end

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  show do |res|
    columns_to_exclude = [:site_id]

    attributes_table do
      (res.class.columns.collect{|column| column.name.to_sym } - columns_to_exclude).each do |c|
        row c
      end
    end
  end

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
