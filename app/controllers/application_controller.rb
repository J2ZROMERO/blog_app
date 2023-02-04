class ApplicationController < ActionController::Base
  def self.current_user
    @user = User.all[0]
  end
end
