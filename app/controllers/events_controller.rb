class EventsController < ApplicationController
  def index
    @events_by_date = Event.order("event_date").group_by{|e| e.event_date.to_date}
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_for_the_day = Event.where("DATE(event_date) = DATE(?)", Time.now).order("event_date")
    respond_to do |format|
      format.html
      format.js # { render json: @employees }
    end
  end

  def events_for_day
    @events_for_the_day = Event.where("DATE(event_date) = DATE(?)", params[:set_date]).order("event_date")

    respond_to do |format|
      format.html { redirect_to events_path }
      format.js # { render json: @employees }
    end
  end
end
