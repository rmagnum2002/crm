require 'spec_helper'

describe CompaniesController do
  include Devise::TestHelpers

  before(:each) do
    @user = create :user
    @company = create :company
  end

  describe "GET #index" do
    it "should show companies when is logged" do
      sign_in @user
      get :index
      response.should be_success
    end

    it "should redirect to sign in page when is not logged" do
      get :index
      response.should redirect_to user_session_url
    end
  end

  describe "GET #show" do
    it "should show company when is logged" do
      sign_in @user
      get :show, id: @company.id
      response.should be_success
    end

    it "should redirect to sign in page when is not logged" do
      get :show, id: @company.id
      response.should redirect_to user_session_url
    end

  describe "POST #create" do
    it "should create company when is logged" do
      sign_in @user
      company = lambda {
        post :create, {
          company: {
            responsible_id: @user.id,
            name: "New company",
            company_branch_id: 1,
            client_category_id: 1,
            client_type_id: 1,
            client_status_id: 1,
            company_source_id: 1,
            phone: "+37300000000",
              addresses_attributes: {
                0 => {  address_type: 0,
                      country_id: 1,
                      state_id: 1,
                      postal_code: 2013,
                      street: "Dacia",
                      street_number: "1000" },
                1 => {  address_type: 1,
                      country_id: 1,
                      state_id: 1,
                      postal_code: 2013,
                      street: "Decebal",
                      street_number: "2000" }
              }
          }
        }
      }.should change(Company, :count).by(1)
      response.should be_redirect
    end

    it "should render #new when required fields is not present" do
      sign_in @user
      post :create
      response.should render_template("new")
    end
  end

  describe "PUT #update" do
    it "should update company when field is updated" do
      sign_in @user
      put :update, {
        id: @company.id,
        company: {
          name: "New company name"
        }
      }
      response.should be_redirect
    end
  end

  describe "#show_contacts" do
    it "should #show_contacts" do
      sign_in @user
      xhr :get, :show_contacts, id: @company.id
      response.should be_success
    end
  end

  describe "#show_address" do
    it "should #show_address" do
      sign_in @user
      xhr :get, :show_address, id: @company.id
      response.should be_succes
    end
  end

  describe "#show_comments" do
    it "should #show_comments" do
      sign_in @user
      xhr :get, :show_comments, id: @company.id
      response.should be_success
    end
  end

  describe "#show_sales" do
    it "should show #sales" do
      sign_in @user
      xhr :get, :sales, id: @company.id
      response.should be_success
    end
  end

  describe "#destroy company" do
    it "should destroy company" do
      sign_in @user
      delete :destroy, id: @company.id
      response.should redirect_to companies_url
    end
  end
end
