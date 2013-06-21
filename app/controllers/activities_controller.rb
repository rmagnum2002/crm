class ActivitiesController < ApplicationController
  load_and_authorize_resource

  def index
    @activities = Activity.order("updated_at desc").includes([:user, :trackable]).page(params[:page]).per_page(10)
  end
end
