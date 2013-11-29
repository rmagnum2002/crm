ActiveAdmin.register CompanySource do
  menu :parent => 'Settings', :label => proc { I18n.t(:company_sources) }

  filter :name
  filter :name_ro
  filter :name_ru
  filter :created_at
  filter :updated_at
end
