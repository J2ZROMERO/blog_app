class Api::CommentController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    @comments = Comment.where(author_id: params[:user_id])
    render json: @comments
  end
  
  def create
    comment = Comment.new(author_id: current_user.id, posts_id: params[:post_id], Text: params[:text])

    if comment.save
      render json: comment, status: :created
    else
      render json: { errors: comment.errors }, status: :unprocessable_entity
    end
  
  end

  protected

  def json_request?
    request.format.json?
  end
  
end
