class Api::UserController < ApplicationController
    
      def index
        @all = User.all

        render json: @all
      end

      def show
        @posts = Post.where(author_id: params[:id])

        render json: @posts
      end

      def comments
        post = Post.find(params[:post_id])
        @comments = post.comments
        render json: @comments
      end
      
      def add_comment
        post = Post.find(params[:post_id])
        comment = post.comments.build(content: params[:content], user_id: current_user.id)
        if comment.save
          render json: { success: true, message: 'Comment created successfully' }
        else
          render json: { success: false, message: 'Comment could not be created' }
        end
      end

end
