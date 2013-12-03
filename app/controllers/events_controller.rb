class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    t = Time.now
    @events_by_date = @current_site.events.where(:event_date =>  t.beginning_of_month..t).
        order('event_date').group_by{|e| e.event_date.to_date}
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today

    @events_for_the_day = @current_site.events.where(:event_date =>  t.beginning_of_day..t.end_of_day).order('event_date')

    respond_to do |format|
      format.html
      format.js # { render json: @employees }
    end
  end

  def events_for_day
    t1 = Time.parse(params[:set_date]).beginning_of_day
    @events_for_the_day = @current_site.events.where("event_date between ? and ?", t1, t1.end_of_day).order('event_date')

    respond_to do |format|
      format.html { redirect_to events_path }
      format.js # { render json: @employees }
    end
  end

  def open_details
    @event = @current_site.events.find(params[:id])
  end
end
