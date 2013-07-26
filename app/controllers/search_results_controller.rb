class SearchResultsController < ApplicationController
  # GET /companies
  # GET /companies.json
  def index
     @companies = Company.text_search(params[:query])
     @employees = Employee.text_search(params[:query])
     # @users = User.text_search(params[:query])

    respond_to do |format|
      format.js
    end
  end
end
