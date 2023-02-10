class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @stylesheet = 'post/show'
    @comment = Comment.new
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

  def create
    return unless user_signed_in?
  @current_user = current_user

    @comment = Comment.new(comment_params.merge({Text: params[:comment][:text],posts_id: params[:post_id], author_id: @current_user.id}))

    if @comment.save
      flash[:notice] = 'post created successfully'
      redirect_to user_post_path(user_id: @current_user.id, id: params[:post_id])

    else
      flash[:alert] = 'Error whe the post was created'
      render 'new'

    end
  end

  private


  def comment_params
    params.require(:comment).permit(:Text)
  end

end
