class PostController < ApplicationController
  layout 'application'
  def index
    @stylesheet = 'post/post'
    @users = User.find_by(id: params[:user_id]) # object no proper of the database we use new instead of find
    @posts_counter = Post.where(author_id: params[:user_id]).count
    @comments_count_by_post = {}
    @likes_count_by_post = {}
    @comments_by_post = {}
    @users_by_post = {}
    
    @posts = User.see_3recent_posts(params[:user_id])
    @posts.each do |post|
      @comments_count_by_post[post.id] = Comment.where(posts_id: post.id, author_id: params[:user_id]).count
      @likes_count_by_post[post.id] =  Post.group(:id).find_by(id: post.id,author_id: params[:user_id]).LikesCounter
      @comments_by_post[post.id] = Comment.where(author_id: params[:user_id] ,posts_id: post.id)
     
    end
  
  end

  def show
    @stylesheet = 'post/show'
    @post = Post.find_by(id: params[:id],author_id: params[:user_id])
    @comments_count_by_post = Comment.where(posts_id: params[:id] , author_id: params[:user_id]).count
    @likes_count_by_post =  Post.group(:id).find_by(id: params[:id],author_id: params[:user_id]).LikesCounter
    @comments_by_post = Comment.where(author_id: params[:user_id] , posts_id: params[:id])
  end
end
