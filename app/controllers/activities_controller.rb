class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @activities = @current_site.activities.order('updated_at desc').includes([:user, :trackable]).page(params[:page]).per_page(10)
  end
end
