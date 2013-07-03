require 'spec_helper'

describe CommentsController do
	  include Devise::TestHelpers

	before(:each) do
    @user = create :user
    @company = create :company
    @comment = create :comment
  end

	describe "POST create" do

    it "should create comment" do
			sign_in @user
			lambda {
      # session[:user_id] = @user.id
      xhr :post, :create, { comment: { content: "new comment" }, company_id: @company.id } }
      .should change(Comment, :count).by(1)
      response.should render_template("comments/create")
		end
	end

	describe "DELETE comment" do

    it "should delete comment" do
			sign_in @user
			xhr :delete, :destroy, { id: @comment.id }
			response.should render_template("comments/destroy")
		end
	end
end
