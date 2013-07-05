require 'spec_helper'

describe EmployeesController do
  include Devise::TestHelpers

  before(:each) do
    @user = create :user
    @company = create :company
    @employee = create :employee
  end

  describe "GET #index" do
    it "should show employees" do
      sign_in @user
      get :index
      response.should be_succes
    end
  end

  describe "GET #show" do
    it "should show employee" do
      sign_in @user
      get :show, id: @employee.id, company_id: @company.id
      response.should be_succes
    end
  end

  describe "POST #create" do
    it "should create employee when required fields is present" do
      sign_in @user
      lambda {
        post :create, {
          company_id: @company.id,
          employee: {
            first_name: "Jim",
            last_name: "Bean",
            gender_id: 1
          }
        }
      }.should change(Employee, :count).by(1)
      response.should be_redirect
    end

    it "should render action #new when required fields not present" do
      sign_in @user
      post :create, company_id: @company.id
      response.should render_template("new")
    end
  end

  describe "PUT #update" do
    it "should update employee" do
      sign_in @user
      put :update, {
        id: @employee.id,
        first_name: "Alexandru",
        last_name: "Lyashenko",
        gender_id: 1
      }
      response.should be_redirect
    end
  end

  describe "DELETE #destroy" do
    it "should destroy employee" do
      sign_in @user
      delete :destroy, id: @employee.id
      response.should redirect_to employees_url
    end
  end
end
