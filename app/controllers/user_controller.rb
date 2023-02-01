class UserController < ApplicationController
  layout 'application'
  def index
     @stylesheet = 'user/user'
     @users = User.all
  end
  
  def show
    @stylesheet = 'user/show'
    @users = User.find_by(id: params[:id]) # object no proper of the database we use new instead of find
    @posts = User.see_3recent_posts(@users.id)
    @comments = Comment.where(author_id: params[:id]).count
    @posts_counter = Post.where(author_id: params[:id]).count
  end
  
end
