class CommentsController < ApplicationController
  before_filter :load_commentable, %w{destroy}

  load_and_authorize_resource

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
      expire_fragment "#{t(:"activity.index.activities")}"
      expire_fragment "#{@comment.commentable_type.downcase}_#{@comment.commentable_id}_#{t(:"company.show.comments")}"
      track_activity @comment
      respond_to do |format|
        format.js
      end
    else
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
    authorize! :destroy, @comment
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
