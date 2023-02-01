class UserController < ApplicationController
  layout 'application'
  def index
     @stylesheet = 'user/user'
  end
  
  def show
    @stylesheet = 'user/show'
    @user = User.new(id: params[:id]) # object no proper of the database we use new instead of find
  end
  
end
