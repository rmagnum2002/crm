class ProfileController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @responsible = Company.where(responsible_id: @user.id)
    @activities = @user.activities.order("created_at desc")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end
end
