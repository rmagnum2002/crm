class CompaniesDatatable
  include CompaniesHelper

  delegate :params, :h, :t, :current_language, :link_to, :mail_to, to: :@view
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
        h(company.created_at.strftime("%B %e, %Y")),
        link_to(company.name, company),
        h(dt_client_category(company)),
        h(dt_client_type(company)),
        h(dt_company_source(company)),
        h(dt_company_branch(company)),
        h(company.phone),
        h(company.fax),
        h(company.skype),
        h(mail_to company.email),
        h(mail_to company.fisc_id),
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
      companies = companies.joins(:client_category, :client_type, :company_source, :company_branch).where("companies.id like :search
                          or companies.name like :search
                          or client_categories.name like :search
                          or client_categories.name_ro like :search
                          or client_categories.name_ru like :search
                          or company_sources.name like :search
                          or company_sources.name_ro like :search
                          or company_sources.name_ru like :search
                          or company_branches.name like :search
                          or company_branches.name_ro like :search
                          or company_branches.name_ru like :search
                          or client_types.name like :search
                          or client_types.name_ro like :search
                          or client_types.name_ru like :search
                          or companies.phone like :search
                          or companies.fax like :search
                          or companies.skype like :search
                          or companies.fisc_id like :search
                          or companies.email like :search", search: "%#{params[:sSearch]}%")
    end
    companies
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 50
  end

  def sort_column
    columns = %w[id created_at name client_category_id client_type_id company_source_id company_branch_id phone fax skype email fisc_id responsible_id]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
