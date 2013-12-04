require 'spec_helper'

describe CommentsController do
  before do
    @site = create :site
    request.host = @site.host
    @user = create :user, site: @site

    @company = create :company, site: @site
  end

  describe 'POST create' do
    it 'should create comment' do
      sign_in @user
      expect {
        xhr :post, :create, {comment: {content: 'new comment'}, company_id: @company.id} }
      .to change(Comment, :count).by(1)
      response.should render_template('comments/create')
    end
  end

  describe 'DELETE comment' do
    it 'should delete comment' do
      sign_in @user
      @comment = create :comment, user: @user

      xhr :delete, :destroy, id: @comment.id, company_id: @company.id
      response.should render_template('comments/destroy')
    end
  end
end
