class Api::CommentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  include Devise::Controllers::Helpers


  def index
    @comments = Comment.where(author_id: params[:user_id])
    render json: @comments
  end

  def create
    current_user = warden.authenticate!(scope: :user)

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
