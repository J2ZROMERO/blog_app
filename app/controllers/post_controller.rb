class PostController < ApplicationController
  layout 'application'
  def index
    @stylesheet = 'post/post'
  end

  def show
    @stylesheet = 'post/show'
    @post = Post.new(id: params[:id]) # object no proper of the database we use new instead of find
  end
end
