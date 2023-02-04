class CommentsController < ApplicationController

    def new
        @stylesheet = 'post/show'
        @comment =  Comment.new
        
    end

    def create
        @id_user = ApplicationController.current_user.id
           @comment =  Comment.create(posts_id: params[:post_id], author_id: @id_user, Text:  params[:comment][:text] )
            if @comment.save
              flash[:notice] = "post created successfully"
              redirect_to  user_posts_path(:user_id =>  @id_user)
          
            else
              flash[:alert] = "Error whe the post was created"
              render 'new'
        
          end
          
        end
        
        private
        
        def article_params
        params.require(:comment).permit(:text)
        end
end
