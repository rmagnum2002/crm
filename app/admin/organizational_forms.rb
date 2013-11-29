ActiveAdmin.register OrganizationalForm do
  menu :parent => 'Settings', :label => proc { I18n.t('organizational_forms') }

  filter :name
  filter :name_ro
  filter :name_ru
  filter :created_at
  filter :updated_at
end
