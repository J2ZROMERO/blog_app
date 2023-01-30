class PostController < ApplicationController

    def index
    end
   
    def show
        @post = Post.new(id: params[:id]) #object no proper of the database we use new instead of find
    end
end
