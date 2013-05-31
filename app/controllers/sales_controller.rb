class SalesController < ApplicationController
  before_filter :load_saleable, except: %w[index]

  load_and_authorize_resource

  def index
    @sales = Sale.order('created_at desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end

  def new
    @sale = @saleable.sales.new
  end

  def create
    @sale = @saleable.sales.new(params[:sale])
    @sale.user_id = current_user.id
    if @sale.save
      track_activity @sale
      @sale.update_ammount
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @sale = Comment.find(params[:id])
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
