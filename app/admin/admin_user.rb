ActiveAdmin.register AdminUser do
  menu :label => proc { I18n.t :admin_users }

  #scope_to :current_site

  after_build do |user|
    user.site = @site
  end

  controller do
    def scoped_collection
      AdminUser.where(site_id: @site.id)
    end
  end

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
