ActiveAdmin.register State do
  menu :parent => 'Address', :label => proc { I18n.t(:states) }

  filter :name
  filter :name_ru
  filter :name_ro
end
