class UserController < ApplicationController
  layout 'application'
  def index
     @stylesheet = 'user/user'
     @users = User.all
  end
  
  def show
    @stylesheet = 'user/show'
    @users = User.find_by(id: params[:id]) # object no proper of the database we use new instead of find
    @posts = Post.return5_recent_post(params[:id])
    @comments = Comment.where(id: params[:id]).count
    @posts_counter = Post.where(id: params[:id]).count
  end
  
end
