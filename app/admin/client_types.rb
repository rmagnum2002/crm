ActiveAdmin.register ClientType do
  menu :parent => 'Settings', :label => proc{ I18n.t('client_types') }

  filter :name
  filter :created_at
  filter :updated_at
end
