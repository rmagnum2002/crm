require 'spec_helper'

describe CommentsController do
	  include Devise::TestHelpers

	before(:each) do
    @user = create :user
    @company = create :company
    @comment = create :comment
  end
	
	describe "POST create" do
		it "should create a comment" do
			pending
		end
			
	end


end
