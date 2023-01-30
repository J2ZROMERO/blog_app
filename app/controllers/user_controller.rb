class UserController < ApplicationController
  
    def index
    end

    def show
        @user = User.new(id: params[:id]) #object no proper of the database we use new instead of find
    end

end
