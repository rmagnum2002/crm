class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.accessible_by(current_ability)
  end

  def show
    @user = User.find(params[:id])
    @responsible = Company.where(responsible_id: @user.id)
    @activities = @user.activities.order("created_at desc").includes([:user, :trackable]).paginate(:page => params[:page], :per_page => 10)
    @total = @user.sales.sum(&:ammount)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
      format.js
    end
  end
end
