class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    @stylesheet = 'post/post'
    super
  end

  # POST /resource/password
  def create
    @stylesheet = 'post/post'
    if params[:user].present? && params[:user][:email].present?
      super
    else
      flash[:error] = 'Email is required'
    end
  end

  private

  def resource_params
    params.require(:user).permit(:email)
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
