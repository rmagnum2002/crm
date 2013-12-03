class SearchResultsController < ApplicationController
  before_filter :authenticate_user!

  def index
     @companies = @current_site.companies.text_search(params[:query])
     @employees = Employee.join(:company).where(conpany: {site_id: @current_site.id}).text_search(params[:query])

    respond_to do |format|
      format.js
    end
  end
end
