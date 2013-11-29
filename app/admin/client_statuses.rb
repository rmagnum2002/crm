ActiveAdmin.register ClientStatus do
  menu :parent => 'Settings', :label => proc{ I18n.t('client_statuses') }
  filter :name
  filter :created_at
  filter :updated_at

end
