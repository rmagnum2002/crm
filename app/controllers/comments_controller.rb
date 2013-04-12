class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to company_path(@commentable) }
      format.json { head :no_content }
    end
  end

private

  def load_commentable
    # resource, id = request.path.split('/')[1, 2]
    # @commentable = resource.singularize.classify.constantize.find(id)
    @commentable = Company.find(params[:company_id])
  end
end
