class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    @stylesheet = 'post/post'
    super
  end

  # POST /resource/password
  #
  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    @stylesheet = 'post/post'
    super
  end

  def create
    @stylesheet = 'post/post'
    super
  end

  # PUT /resource/password

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
