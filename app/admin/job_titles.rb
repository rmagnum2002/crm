ActiveAdmin.register JobTitle do
  menu :parent => "Settings", :label => proc{ I18n.t("job_titles") }

  filter :name
  filter :name_ro
  filter :name_ru
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_ro
      f.input :name_ru
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :name_ro
      row :name_ru
      row :created_at
      row :updated_at
    end
  end

end
