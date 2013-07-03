require 'spec_helper'

describe SalesController do
  include Devise::TestHelpers

  before(:each) do
    @user = create :user
    @sale = create :sale
  end

  describe "GET #index" do
    it "should show sales" do
      sign_in @user
      get :index
      response.should be_succes
    end
  end

end
