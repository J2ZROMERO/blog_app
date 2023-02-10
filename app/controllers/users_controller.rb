class UsersController < ApplicationController
  load_and_authorize_resource
  layout 'application'
  
  def index
    @stylesheet = 'user/user'
    @users = User.all
    @posts_count_by_user = {}
    
    @users.each do |user|
      @posts_count_by_user[user.id] = Post.where(author_id: user.id).count
      
    end
    return unless user_signed_in?

    @current_user = current_user
  end


  def show
    @stylesheet = 'user/show'
    @users = User.find_by(id: params[:id]) # object no proper of the database we use new instead of find
    @posts = User.see_3recent_posts(params[:id])
    @posts_counter = Post.where(author_id: params[:id]).count
    @comments_count_by_post = {}
    @likes_count_by_post = {}
    @total_posts = {}
    @t = Post.find_by(author_id: 3)
    return unless user_signed_in?
    @current_user = current_user

    @posts.each do |post|
      @comments_count_by_post[post.id] = Comment.where(posts_id: post.id, author_id: params[:id]).count
      @likes_count_by_post[post.id] = Post.group(:id).find_by(id: post.id, author_id: params[:id]).LikesCounter
      @total_posts[post.id] = Post.find_by(id: post.id)
    end
  end
end
