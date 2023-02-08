class PostsController < ApplicationController
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
      @likes_count_by_post[post.id] = Post.group(:id).find_by(id: post.id, author_id: params[:user_id]).LikesCounter
      @comments_by_post[post.id] = Comment.includes(:user).where(author_id: params[:user_id], posts_id: post.id)
    end
  end

  def show
    @stylesheet = 'post/show'
    @post_id = Post.find(params[:id])
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @comments_count_by_post = Comment.where(posts_id: params[:id], author_id: params[:user_id]).count
    @likes_count_by_post = Post.group(:id).find_by(id: params[:id], author_id: params[:user_id]).LikesCounter
    @comments_by_post = Comment.includes(:post).where(posts_id: params[:id])
  end

  def like
    @like = Post.find_by(author_id: ApplicationController.current_user.id, id: params[:id])
    @likes_counter = Post.find_by(author_id: ApplicationController.current_user.id, id: params[:id]).LikesCounter
    if @like.update(LikesCounter: @likes_counter + 1)

      Like.update_likes_counter(ApplicationController.current_user.id, params[:id])
      flash[:notice] = 'Like created successfully'
      redirect_to user_post_path
    else
      flash[:alert] = 'Error whe the  was created'
      render 'new'

    end
  end

  def new
    @stylesheet = 'post/show'
    @post = Post.new
  end

  def create
    @id_user = ApplicationController.current_user.id
    @post = Post.new(author_id: @id_user, Title: params[:post][:Title], Text: params[:post][:Text],
                     CommentsCounter: 0, LikesCounter: 0)
    if @post.save
      flash[:notice] = 'post created successfully'
      redirect_to user_path(@id_user)

    else
      flash[:alert] = 'Error whe the post was created'
      render 'new'

    end
  end

  private

  def post_params
    params.require(:posts).permit(:title, :text)
  end
end
