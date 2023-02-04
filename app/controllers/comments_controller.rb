class CommentsController < ApplicationController

    def new
        @stylesheet = 'post/show'
        @comment =  Comment.new
    end

    def create
    end

end
