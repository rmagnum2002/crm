require 'spec_helper'

describe CommentsController do

	before do
    @user = FactoryGirl.create :user
    sign_in @user
  end
	
	describe "POST create" do
		it "should create a comment" do
			
	end

end