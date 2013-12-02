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
        @company = Company.find(params[:id])
        @versions = @company.versions
        @company = @company.versions[params[:version].to_i].reify if params[:version]
        show! #it seems to need this
    end
  end

  sidebar :versionate, :partial => "layouts/version", :only => :show
end
