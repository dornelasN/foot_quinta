class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_name = current_user.name

    if @comment.save
      redirect_to root_url
      flash[:success] = 'Your comment was added with success'
    else
      redirect_to root_url
      flash[:danger] = 'Your comment was not added'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end
end
