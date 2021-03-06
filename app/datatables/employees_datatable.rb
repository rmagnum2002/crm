class EmployeesDatatable
  include EmployeesHelper

  delegate :params, :h, :t, :current_language, :link_to, :mail_to, to: :@view
  delegate :url_helpers, to: 'Rails.application.routes'

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Employee.count,
      iTotalDisplayRecords: employees.total_entries,
      aaData: data
    }
  end

private
  def data
    employees.map do |employee|
      [
        h(employee.id),
        link_to((employee.full_name), url_helpers.profile_employee_path(employee), {:remote => true, 'data-toggle' => 'modal', 'data-target' => "#modal-window", 'data-backdrop' => true, 'data-keyboard' => true}),
        h(dt_gender(employee)),
        h(dt_language(employee)),
        h(employee.company.name),
        h(dt_job_title(employee)),
        h(employee.phone),
        h(employee.mobile),
        h(employee.simtravel),
        h(employee.email),
        h(employee.skype),
        h(employee.facebook)
      ]
    end
  end

  def employees
    @employees ||= fetch_employees
  end

  def fetch_employees
    employees = Employee.order("#{sort_column} #{sort_direction}")
    employees = employees.page(page).per_page(per_page)
    if params[:sSearch].present?
      employees = employees.joins(:company, :language, :gender, :job_title).where("employees.id like :search
                                    or employees.first_name like :search
                                    or employees.last_name like :search
                                    or employees.patronymic like :search
                                    or employees.phone like :search
                                    or employees.email like :search
                                    or languages.name like :search
                                    or languages.name_ro like :search
                                    or languages.name_ru like :search
                                    or genders.name like :search
                                    or genders.name_ro like :search
                                    or genders.name_ru like :search
                                    or job_titles.name like :search
                                    or job_titles.name_ro like :search
                                    or job_titles.name_ru like :search
                                    or companies.name like :search",
                                  search: "%#{params[:sSearch]}%")
    end
    employees
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 50
  end

  def sort_column
    columns = %w[id first_name gender_id company_id]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
