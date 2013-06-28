require 'spec_helper'

describe CompaniesController do
  include Devise::TestHelpers

  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  describe "GET #index" do
    it "returns HTTP success" do
      get :index
      response.should be_success
    end
  end

end
