class PostsController < ApplicationController
  layout 'application'
  load_and_authorize_resource
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
      @likes_count_by_post[post.id] = Post.group(:id).find_by(id: post.id, author_id: params[:user_id]).LikesCounter
      @comments_by_post[post.id] = Comment.includes(:user).where(author_id: params[:user_id], posts_id: post.id)
    end
  end

  def destroy
    return unless user_signed_in?

    @current_user = current_user
    post = Post.find(params[:id])
    user = User.find(params[:user_id])
    post.comments.destroy_all
    post.destroy
    user.update(PostsCounter: user.posts.count)
    redirect_to user_path(params[:id])
  end

  def show
    @stylesheet = 'post/show'
    @post_id = Post.find(params[:id])
    @post = Post.find_by(id: params[:id])
    @comments_count_by_post = Comment.where(posts_id: params[:id]).count
    @likes_count_by_post = Like.includes(:post).find_by(posts_id: params[:id])

    if @likes_count_by_post.nil?

      @likes_count_by_post = Like.create(author_id: @current_user.id, posts_id: params[:id])
    else
      @likes_count_by_post.post.LikesCounter

    end

    @comments_by_post = Comment.includes(:post).where(posts_id: params[:id])
  end

  def like
    return unless user_signed_in?

    @current_user = current_user

    @like = Like.find_by(author_id: @current_user.id, posts_id: params[:id])
    if @like
      @likes_counter = @like.post.LikesCounter
      if @like.post.update(LikesCounter: @likes_counter + 1)

        flash[:notice] = 'Like created successfully'
        redirect_to user_post_path
      else
        flash[:alert] = 'Error whe the like was created'
        render 'new'
      end
    else
      flash[:alert] = 'Post not found'
      Like.create(author_id: @current_user.id, posts_id: 33)

      Like.find_by(author_id: @current_user.id, posts_id: 33).post.LikesCounter = 1
    end
  end

  def new
    @stylesheet = 'post/show'
    @post = Post.new
    return unless user_signed_in?

    @current_user = current_user
  end

  def create
    @stylesheet = 'post/show'
    return unless user_signed_in?

    @current_user = current_user

    @post = Post.new(author_id: @current_user.id, Title: params[:post][:Title], Text: params[:post][:Text],
                     CommentsCounter: 0, LikesCounter: 0)
    if @post.save
      flash[:notice] = 'post created successfully'
      ide = params[:id].to_i
      puts ide
      redirect_to user_path(id: @current_user.id)

    else
      flash[:alert] = 'Error whe the post was created'
      render 'new'

    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
