class CreateLikesController < ApplicationController
  before_action :set_create_like, only: %i[show edit update destroy]

  # GET /create_likes or /create_likes.json
  def index
    @create_likes = CreateLike.all
  end

  # GET /create_likes/1 or /create_likes/1.json
  def show; end

  # GET /create_likes/new
  def new
    @create_like = CreateLike.new
  end

  # GET /create_likes/1/edit
  def edit; end

  # POST /create_likes or /create_likes.json
  def create
    @create_like = CreateLike.new(create_like_params)

    respond_to do |format|
      if @create_like.save
        format.html { redirect_to create_like_url(@create_like), notice: 'Create like was successfully created.' }
        format.json { render :show, status: :created, location: @create_like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_likes/1 or /create_likes/1.json
  def update
    respond_to do |format|
      if @create_like.update(create_like_params)
        format.html { redirect_to create_like_url(@create_like), notice: 'Create like was successfully updated.' }
        format.json { render :show, status: :ok, location: @create_like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @create_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_likes/1 or /create_likes/1.json
  def destroy
    @create_like.destroy

    respond_to do |format|
      format.html { redirect_to create_likes_url, notice: 'Create like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_create_like
    @create_like = CreateLike.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def create_like_params
    params.require(:create_like).permit(:AuthorId, :PostId)
  end
end
