class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
  end

  def show
    @id = params[:id]
    @user_id = params[:user_id]
  end
end
