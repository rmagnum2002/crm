ActiveAdmin.register ClientCategory do
  menu :parent => 'Settings', :label => proc{ I18n.t('client_categories') }
  filter :name
  filter :created_at
  filter :updated_at

end
