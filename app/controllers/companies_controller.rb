class CompaniesController < ApplicationController
  before_filter :load_company, except: %w{index new create search country_select_legal country_select_invoicing}

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
    @commentable = @company
    @comments = @commentable.comments.order('created_at desc')
    @comment = Comment.new
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
    @countries = Country.all.map{ |c| [c.name, c.id] }
    @states = State.all.map{ |s| [s.name, s.id] }
    2.times { @company.addresses.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @addresses = @company.addresses.limit(2)
    @show_label = true

    @addresses.each do |add|
      if add.address_type?
        @states_1 = State.where(country_id: add.country_id).map{ |c| [c.name, c.id] }
      else
        @states_0 = State.where(country_id: add.country_id).map{ |c| [c.name, c.id] }
      end
    end
    # @states = State.all.map{ |s| [s.name, s.id] }
     @countries = Country.all.map{ |c| [c.name, c.id] }
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])
    @company.user_id = current_user.id
    @addresses = @company.addresses
    @countries = Country.all.map{ |c| [c.name, c.id] }

    respond_to do |format|
      if @company.save
        track_activity @company
        format.html { redirect_to @company, notice: "#{t(:"messages.created")}" }
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
        # todo
        # if @company.changed?
          track_activity @company
          @message = "#{t(:"messages.updated")}"
        # else
          # @message = "Nothing to update"
        # end
        format.html { redirect_to @company, notice: @message }
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
    @addresses = @company.addresses
  end

  def comments
    @commentable = @company
    @comments = @commentable.comments.order('created_at desc')
    @comment = Comment.new
  end

  def sales
    @saleable = @company
    @sale = Sale.new
    @sales = @saleable.sales.order('created_at desc')
    @total = @sales.sum(&:ammount)
  end

  def revisions
    @versions = @company.versions.order("created_at desc")
  end

  def delete_company
    if @company.marked_to_remove == false
      @company.update_attributes(marked_to_remove: true)
    else
      @company.update_attributes(marked_to_remove: false)
    end
    redirect_to :back
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

  def country_select_legal
    if params[:country_id].present?
      @states_0 = Country.find(params[:country_id]).states
    else
      @states_0 = []
    end
    respond_to do |format|
      format.js
    end
  end

  def country_select_invoicing
    if params[:country_id].present?
      @states_1 = Country.find(params[:country_id]).states
    else
      @states_1 = []
    end
    respond_to do |format|
      format.js
    end
  end
end
