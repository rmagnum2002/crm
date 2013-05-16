class EmployeesDatatable
  include EmployeesHelper

  delegate :params, :h, :t, :link_to, :mail_to, to: :@view
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
        t(Employee::GENDER[employee.gender]),
        t(Employee::LANGUAGE[employee.language]),
        h(employee.company.name),
        h(employee.job_title.job_title),
        h(employee.decision),
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
      employees = employees.where("id like :search
                                    or first_name like :search
                                    or last_name like :search
                                    or phone like :search
                                    or email like :search",
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
    columns = %w[id first_name gender]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
