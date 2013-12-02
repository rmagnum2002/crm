ActiveAdmin.register State do
  menu :parent => 'Address', :label => proc { I18n.t(:states) }

  filter :name
  filter :name_ru
  filter :name_ro

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_ro
      f.input :name_ru
      f.input :country_id, :label => 'Country', :as => :select, :collection => assigns[:site].countries.map {|c|[ c.name, c.id]}
    end

    f.actions
  end

end
