class CompaniesController < ApplicationController
  before_filter :load_company, except: %w{index new create search}

  load_and_authorize_resource

  # GET /companies
  # GET /companies.json
  def index
    # @companies = Company.all

    @search = Company.search(params[:q])
    @companies = @search.result
    @search.build_condition

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: CompaniesDatatable.new(view_context) }
    end
  end

  def search
    @search = Company.search(params[:q])
    @companies = @search.result
    @search.build_condition
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new
    @addresses = @company.addresses
    2.times { @company.addresses.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @addresses = @company.addresses.limit(2)
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])
    @company.user_id = current_user.id

    respond_to do |format|
      if @company.save
        track_activity @company
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update_attributes(params[:company])
        track_activity @company
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_contacts
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html { redirect_to @company }
      format.js
    end
  end

  def show_address
  end

  def comments
    @commentable = @company
    @comments = @commentable.comments.order('created_at desc')
    @comment = Comment.new
  end

  def sales
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
end
