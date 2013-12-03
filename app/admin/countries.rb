ActiveAdmin.register Country do
  menu :parent => 'Address', :label => proc { I18n.t(:countries) }

  filter :name
  filter :name_ru
  filter :name_ro
  filter :created_at
  filter :updated_at

  show do |res|
    attributes_table do
      row :id
      row :name
      row :name_ru
      row :name_ro
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_ru
      f.input :name_ro
    end

    f.actions
  end

end
