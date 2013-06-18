ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # div :class => "blank_slate_container", :id => "dashboard_default_message" do
      # span :class => "blank_slate" do
        # span I18n.t("active_admin.dashboard_welcome.welcome")
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    # end

    # section "Recently updated content" do
    #   table_for Version.order('id desc').limit(20) do
    #     column "Item" do |v| v.item.name end
    #     column "Type" do |v| v.item_type.underscore.humanize end
    #     column "Modified at" do |v| v.created_at.to_s :long end
    #     column "Admin" do |v| link_to User.find(v.whodunnit).full_name, admin_user_path(User.find(v.whodunnit)) end
    #   end
    # end

    # div :class => "panel" do
    #   panel "20 #{I18n.t("active_admin.home.recent_signed_up_users")}" do
    #     table_for User.order("created_at desc").limit(20) do
    #       column I18n.t("active_admin.user.full_name") do |user|
    #         link_to(user.full_name, admin_user_path(user))
    #       end
    #       column :email
    #       column I18n.t("active_admin.user.created_at") do |user|
    #         l user.created_at, format: :long
    #       end
    #       column I18n.t("active_admin.user.sign_in_at") do |user|
    #         l user.last_sign_in_at, format: :long if user.last_sign_in_at.present?
    #       end
    #     end
    #     strong { link_to I18n.t("active_admin.home.view_all_users"), admin_users_path }
    #   end
    # end

    div :class => "panel" do
      panel "10 #{I18n.t("active_admin.home.recent_companies")}" do
        table_for Company.order("created_at desc").limit(10) do
          column :name do |comp|
            link_to(comp.name, admin_company_path(comp))
          end
          column "Added by" do |comp|
            link_to(comp.user.full_name, admin_user_path(comp.user))
          end
          column "Managed by" do |comp|
            link_to responsible_name(comp.responsible_id)
          end
          # column :first_name
          # column :created_at
        end
        strong { link_to I18n.t("active_admin.home.view_all_companies"), admin_companies_path }
      end
    end

    div :class => "panel" do
      panel "10 recent sales" do
        table_for Sale.order("created_at desc").limit(10) do
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

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
