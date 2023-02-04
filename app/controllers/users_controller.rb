class UsersController < ApplicationController
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

def new
  @stylesheet = 'user/show'
  @post = Post.new
end  
def create
  @id_user = ApplicationController.current_user.id
     @post = Post.new(author_id: @id_user, Title: "asda", Text: "asdas",CommentsCounter: 0,LikesCounter: 0 )
      if @post.save
        flash[:notice] = "post created successfully"
        redirect_to  user_path(@id_user)
    
      else
        flash[:alert] = "Error whe the post was created"
        render 'new'
  
    end
    
  end
  
  private
  
  def article_params
  params.require(:posts).permit(:title, :text)
  end
  

end
