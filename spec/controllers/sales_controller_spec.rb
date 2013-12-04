require 'spec_helper'

describe SalesController do
  render_views

  before do
    @site = create :site
    @user = create :user, site: @site
    @sale = create :sale, site: @site
    request.host = @site.host
  end

  describe 'GET #index' do
    it 'should show sales' do
      sign_in @user
      get :index
      response.should be_succes
    end
  end

end
