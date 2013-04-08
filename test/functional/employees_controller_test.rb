require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { birthday: @employee.birthday, client_date: @employee.client_date, company_id: @employee.company_id, completion: @employee.completion, decision: @employee.decision, email: @employee.email, facebook: @employee.facebook, first_name: @employee.first_name, gender: @employee.gender, job_title_id: @employee.job_title_id, language: @employee.language, last_name: @employee.last_name, mobile: @employee.mobile, patronymic: @employee.patronymic, phone: @employee.phone, simtravel: @employee.simtravel, skype: @employee.skype, user_id: @employee.user_id }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    put :update, id: @employee, employee: { birthday: @employee.birthday, client_date: @employee.client_date, company_id: @employee.company_id, completion: @employee.completion, decision: @employee.decision, email: @employee.email, facebook: @employee.facebook, first_name: @employee.first_name, gender: @employee.gender, job_title_id: @employee.job_title_id, language: @employee.language, last_name: @employee.last_name, mobile: @employee.mobile, patronymic: @employee.patronymic, phone: @employee.phone, simtravel: @employee.simtravel, skype: @employee.skype, user_id: @employee.user_id }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
