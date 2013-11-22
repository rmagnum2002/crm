class EmployeesController < ApplicationController
  before_filter :authenticate_user!

  # it will be loaded by cancan
  #before_filter :load_company, except: %w(index profile revisions)
  load_and_authorize_resource :through => :company

  # GET /employees
  # GET /employees.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: EmployeesDatatable.new(view_context) }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @hide_employees = true
    @commentable = @employee
    @comments = @commentable.comments.order('created_at desc')
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  def profile
    @employee = Employee.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @show_label = true
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    @employee.company_id = @company.id
    @employee.user = current_user

    respond_to do |format|
      if @employee.save
        expire_fragment "#{t(:"activity.index.activities")}"
        track_activity @employee
        format.html { redirect_to @company, notice: "#{t(:"messages.created")}" }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        expire_fragment "employee_#{@employee.id}_#{t(:"employee.model_title")}_user"
        format.html { redirect_to company_employee_path(@company, @employee), notice: "#{t(:"messages.updated")}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  def delete_employee
    @employee.update_attributes(marked_to_remove: !@employee.marked_to_remove)

    redirect_to company_employee_path(@company, @employee)
  end

  def comments
    @hide_employees = true
    @commentable = @employee
    @comments = @commentable.comments.order('created_at desc')
    @comment = Comment.new
  end

  def revisions
    @versions = @employee.versions.order("created_at desc")
  end
end
