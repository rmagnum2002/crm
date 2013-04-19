class CompaniesDatatable
  include CompaniesHelper

  delegate :params, :h, :link_to, :name, :created_at, :client_category, :client_type, :client_at, :phone, :fax, :email, :responsible_id, to: :@view
  delegate :url_helpers, to: 'Rails.application.routes'

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
  {
    sEcho: params[:sEcho].to_i,
    iTotalRecords: Company.count,
    iTotalDisplayRecords: companies.total_entries,
    aaData: data
  }
end

private
  def data
    companies.map do |company|
      [
        h(company.id),
        h(company.created_at),
        link_to(company.name, company),
        h(company.client_category.category),
        h(company.client_type.client_type),
        h(company.client_at),
        h(company.phone),
        h(company.fax),
        h(company.email),
        link_to(responsible_name_in_datatables(company.responsible_id))
      ]
  end
end

  def companies
    @companies ||= fetch_companies
  end

  def fetch_companies
    companies = Company.order("#{sort_column} #{sort_direction}")
    companies = companies.page(page).per_page(per_page)
    if params[:sSearch].present?
      companies = companies.where("name like :search", search: "%#{params[:sSearch]}%")
    end
    companies
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id name client_type]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
