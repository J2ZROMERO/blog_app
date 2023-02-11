class Api::CommentController < ApplicationController
  def index
    @comments = Comment.where(author_id: params[:user_id])
    render json: @comments
  end
end
