# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  # def after_sign_in_path_for(resource)
  #   # Use the path of your desired view here
  #   users_path
  # end

  # GET /resource/sign_in
  def new
    @stylesheet = 'post/post'
    @user = User.new
  end

  # POST /resource/sign_in
  # def create
  #   @stylesheet = 'post/post'
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
