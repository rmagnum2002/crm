class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order("updated_at desc")
  end
end
