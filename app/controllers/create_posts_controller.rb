class CreatePostsController < ApplicationController
  before_action :set_create_post, only: %i[show edit update destroy]

  # GET /create_posts or /create_posts.json
  def index
    @create_posts = CreatePost.all
  end

  # GET /create_posts/1 or /create_posts/1.json
  def show; end

  # GET /create_posts/new
  def new
    @create_post = CreatePost.new
  end

  # GET /create_posts/1/edit
  def edit; end

  # POST /create_posts or /create_posts.json
  def create
    @create_post = CreatePost.new(create_post_params)

    respond_to do |format|
      if @create_post.save
        format.html { redirect_to create_post_url(@create_post), notice: 'Create post was successfully created.' }
        format.json { render :show, status: :created, location: @create_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_posts/1 or /create_posts/1.json
  def update
    respond_to do |format|
      if @create_post.update(create_post_params)
        format.html { redirect_to create_post_url(@create_post), notice: 'Create post was successfully updated.' }
        format.json { render :show, status: :ok, location: @create_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @create_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_posts/1 or /create_posts/1.json
  def destroy
    @create_post.destroy

    respond_to do |format|
      format.html { redirect_to create_posts_url, notice: 'Create post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_create_post
    @create_post = CreatePost.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def create_post_params
    params.require(:create_post).permit(:AuthorId, :Title, :Text, :CommentsCounter, :LikesCounter)
  end
end
