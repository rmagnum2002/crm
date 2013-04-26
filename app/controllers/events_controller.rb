class EventsController < ApplicationController
  def index
    @events_by_date = Event.all.group_by(&:event_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
