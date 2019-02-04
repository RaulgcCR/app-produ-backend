class FaseTypesController < ApplicationController
  before_action :set_fase_type, only: [:show, :edit, :update, :destroy]

  # GET /fase_types
  # GET /fase_types.json
  def index
    @fase_types = FaseType.all
  end

  # GET /fase_types/1
  # GET /fase_types/1.json
  def show
  end

  # GET /fase_types/new
  def new
    @fase_type = FaseType.new
  end

  # GET /fase_types/1/edit
  def edit
  end

  # POST /fase_types
  # POST /fase_types.json
  def create
    @fase_type = FaseType.new(fase_type_params)

    respond_to do |format|
      if @fase_type.save
        format.html { redirect_to @fase_type, notice: 'Fase type was successfully created.' }
        format.json { render :show, status: :created, location: @fase_type }
      else
        format.html { render :new }
        format.json { render json: @fase_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fase_types/1
  # PATCH/PUT /fase_types/1.json
  def update
    respond_to do |format|
      if @fase_type.update(fase_type_params)
        format.html { redirect_to @fase_type, notice: 'Fase type was successfully updated.' }
        format.json { render :show, status: :ok, location: @fase_type }
      else
        format.html { render :edit }
        format.json { render json: @fase_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fase_types/1
  # DELETE /fase_types/1.json
  def destroy
    @fase_type.destroy
    respond_to do |format|
      format.html { redirect_to fase_types_url, notice: 'Fase type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fase_type
      @fase_type = FaseType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fase_type_params
      params.require(:fase_type).permit(:nombre)
    end
end
