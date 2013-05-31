class ActivitiesController < ApplicationController
  load_and_authorize_resource

  def index
    @activities = Activity.order("updated_at desc")
  end
end
