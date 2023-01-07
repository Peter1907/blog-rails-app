class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(params.require(:comment).permit(:text))
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'Something went wrong'
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post = Post.find(@comment.post_id)
    @post.decrement!(:comments_counter)
    redirect_to @comment.post
  end
end
