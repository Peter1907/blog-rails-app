class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(post_id: params[:post_id])

    if @like.save
      flash[:success] = 'Post liked successfully'
    else
      flash[:error] = 'Something went wrong'
    end
  end
end
