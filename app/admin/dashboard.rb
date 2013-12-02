ActiveAdmin.register_page 'Dashboard' do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => 'panel' do
      panel "20 #{I18n.t('active_admin.home.recent_signed_up_users')}" do
        table_for User.where(site_id: assigns[:site].id).order('created_at desc').limit(20) do
          column I18n.t('active_admin.user.full_name') do |user|
            link_to(user.full_name, admin_user_path(user))
          end
          column :email
          column I18n.t('active_admin.user.created_at') do |user|
            l user.created_at, format: :long
          end
          column I18n.t('active_admin.user.sign_in_at') do |user|
            l user.last_sign_in_at, format: :long if user.last_sign_in_at.present?
          end
        end
        strong { link_to I18n.t('active_admin.home.view_all_users'), admin_users_path }
      end
    end

    div :class => 'panel' do
      panel "10 #{I18n.t('active_admin.home.recent_companies')}" do
        table_for Company.where(site_id: assigns[:site].id).includes(:user, :resp_user).order("created_at desc").limit(10) do
          column :name do |comp|
            link_to(comp.name, admin_company_path(comp))
          end
          column "Added by" do |comp|
            link_to(comp.user.full_name, admin_user_path(comp.user))
          end
          column "Managed by" do |comp|
            link_to comp.resp_user.full_name, admin_user_path(comp.resp_user)
          end
          # column :first_name
          # column :created_at
        end
        strong { link_to I18n.t("active_admin.home.view_all_companies"), admin_companies_path }
      end
    end

    div :class => 'panel' do
      panel '10 recent sales' do
        table_for Sale.where(:site_id => assigns[:site].id).order('created_at desc').limit(10) do
          column "added by" do |sale|
            link_to(sale.user.full_name, admin_user_path(sale))
          end
          column :ammount
          column "buyer" do |sale|
           link_to sale.saleable.name, admin_company_path(sale.saleable)
          end
        end
        strong { link_to "View all sales", admin_sales_path }
      end
    end
  end # content
end
