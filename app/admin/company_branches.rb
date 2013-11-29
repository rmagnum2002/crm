ActiveAdmin.register CompanyBranch do
  menu :parent => 'Settings', :label => proc{ I18n.t('company_branches') }

  filter :name
  filter :created_at
  filter :updated_at

end
