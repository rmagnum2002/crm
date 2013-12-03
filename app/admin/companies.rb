ActiveAdmin.register Company do
  menu :priority => 2, :label => 'Companies'

  filter :name

  form do |f|
    f.inputs do
      f.input :name
    end

    f.actions
  end

  controller do
    def show
        @company = resource
        @versions = @company.versions
        @company = @company.versions[params[:version].to_i].reify if params[:version]
        show! #it seems to need this
    end
  end

  show do |res|
    columns_to_exclude = [:site_id]

    attributes_table do
      (res.class.columns.collect{|column| column.name.to_sym } - columns_to_exclude).each do |c|
        row c
      end
    end
  end


  sidebar :versionate, :partial => "layouts/version", :only => :show
end
