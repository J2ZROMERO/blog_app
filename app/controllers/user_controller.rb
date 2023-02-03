class UserController < ApplicationController
  layout 'application'
  def index
    @stylesheet = 'user/user'
    @users = User.all
    @posts_count_by_user = {}
    @users.each do |user|
      @posts_count_by_user[user.id] = Post.where(author_id: user.id).count
    end
  end

  def show
    @stylesheet = 'user/show'
    @users = User.find_by(id: params[:id]) # object no proper of the database we use new instead of find
    @posts = User.see_3recent_posts(params[:id])
    @posts_counter = Post.where(author_id: params[:id]).count
    @comments_count_by_post = {}
    @likes_count_by_post = {}
    @posts.each do |post|
      @comments_count_by_post[post.id] = Comment.where(posts_id: post.id, author_id: params[:id]).count
      @likes_count_by_post[post.id] = Post.group(:id).find_by(id: post.id, author_id: params[:id]).LikesCounter
    end
  end
end
