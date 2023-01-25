class CreateUsersController < ApplicationController
  before_action :set_create_user, only: %i[show edit update destroy]

  # GET /create_users or /create_users.json
  def index
    @create_users = CreateUser.all
  end

  # GET /create_users/1 or /create_users/1.json
  def show; end

  # GET /create_users/new
  def new
    @create_user = CreateUser.new
  end

  # GET /create_users/1/edit
  def edit; end

  # POST /create_users or /create_users.json
  def create
    @create_user = CreateUser.new(create_user_params)

    respond_to do |format|
      if @create_user.save
        format.html { redirect_to create_user_url(@create_user), notice: 'Create user was successfully created.' }
        format.json { render :show, status: :created, location: @create_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_users/1 or /create_users/1.json
  def update
    respond_to do |format|
      if @create_user.update(create_user_params)
        format.html { redirect_to create_user_url(@create_user), notice: 'Create user was successfully updated.' }
        format.json { render :show, status: :ok, location: @create_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @create_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_users/1 or /create_users/1.json
  def destroy
    @create_user.destroy

    respond_to do |format|
      format.html { redirect_to create_users_url, notice: 'Create user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_create_user
    @create_user = CreateUser.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def create_user_params
    params.require(:create_user).permit(:Name, :Photo, :Bio, :PostsCounter)
  end
end
