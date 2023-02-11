class Api::PostController < ApplicationController
  def show
    @posts = Post.find_by(id: params[:id])

    render json: @posts
  end
end
