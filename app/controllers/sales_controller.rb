class SalesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_saleable, except: %w[index]

  before_filter only: :index do
    @sales = Sale.order('created_at desc')
  end

  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @sales }
      format.js
    end
  end

  def new
    @sale = @saleable.sales.new
  end

  def create
    @sale = @saleable.sales.new(params[:sale])
    @sale.user = current_user

    if @sale.save
      expire_fragment "#{t(:"activity.index.activities")}"
      track_activity @sale
      @sale.update_ammount
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to company_path(@saleable) }
      format.json { head :no_content }
    end
  end

private

  def load_saleable
    resource, id = request.path.split('/')[1, 2]
    @saleable = resource.singularize.classify.constantize.find(id)
  end
end
