class PersonitaController < ApplicationController
  before_action :set_personitum, only: %i[show edit update destroy]

  # GET /personita or /personita.json
  def index
    @personita = Personitum.all
  end

  # GET /personita/1 or /personita/1.json
  def show; end

  # GET /personita/new
  def new
    @personitum = Personitum.new
  end

  # GET /personita/1/edit
  def edit; end

  # POST /personita or /personita.json
  def create
    @personitum = Personitum.new(personitum_params)

    respond_to do |format|
      if @personitum.save
        format.html { redirect_to personitum_url(@personitum), notice: 'Personitum was successfully created.' }
        format.json { render :show, status: :created, location: @personitum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personita/1 or /personita/1.json
  def update
    respond_to do |format|
      if @personitum.update(personitum_params)
        format.html { redirect_to personitum_url(@personitum), notice: 'Personitum was successfully updated.' }
        format.json { render :show, status: :ok, location: @personitum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personita/1 or /personita/1.json
  def destroy
    @personitum.destroy

    respond_to do |format|
      format.html { redirect_to personita_url, notice: 'Personitum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personitum
    @personitum = Personitum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def personitum_params
    params.require(:personitum).permit(:Name, :Photo, :Bio, :PostsCounter)
  end
end
