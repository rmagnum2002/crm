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
  end

end
