class EventsController < ApplicationController
  def index
    @events_by_date = Event.order("event_date").group_by{|e| e.event_date.to_date}
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_for_today = Event.where("DATE(event_date) = DATE(?)", Time.now).order("event_date")
  end
end
