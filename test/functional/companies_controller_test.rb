require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { bank_req: @company.bank_req, branch_id: @company.branch_id, client_at: @company.client_at, client_cat: @company.client_cat, client_type: @company.client_type, email: @company.email, facebook: @company.facebook, fax: @company.fax, fisc_id: @company.fisc_id, name: @company.name, phone: @company.phone, responsible_id: @company.responsible_id, skype: @company.skype, source_id: @company.source_id, user_id: @company.user_id, website: @company.website }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: { bank_req: @company.bank_req, branch_id: @company.branch_id, client_at: @company.client_at, client_cat: @company.client_cat, client_type: @company.client_type, email: @company.email, facebook: @company.facebook, fax: @company.fax, fisc_id: @company.fisc_id, name: @company.name, phone: @company.phone, responsible_id: @company.responsible_id, skype: @company.skype, source_id: @company.source_id, user_id: @company.user_id, website: @company.website }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
