class SamplingTypesController < ApplicationController
  before_action :set_sampling_type, only: [:show, :edit, :update, :destroy]

  # GET /sampling_types
  # GET /sampling_types.json
  def index
    @sampling_types = SamplingType.all
  end

  # GET /sampling_types/1
  # GET /sampling_types/1.json
  def show
  end

  # GET /sampling_types/new
  def new
    @sampling_type = SamplingType.new
  end

  # GET /sampling_types/1/edit
  def edit
  end

  # POST /sampling_types
  # POST /sampling_types.json
  def create
    @sampling_type = SamplingType.new(sampling_type_params)

    respond_to do |format|
      if @sampling_type.save
        format.html { redirect_to @sampling_type, notice: 'Sampling type was successfully created.' }
        format.json { render :show, status: :created, location: @sampling_type }
      else
        format.html { render :new }
        format.json { render json: @sampling_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sampling_types/1
  # PATCH/PUT /sampling_types/1.json
  def update
    respond_to do |format|
      if @sampling_type.update(sampling_type_params)
        format.html { redirect_to @sampling_type, notice: 'Sampling type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sampling_type }
      else
        format.html { render :edit }
        format.json { render json: @sampling_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sampling_types/1
  # DELETE /sampling_types/1.json
  def destroy
    @sampling_type.destroy
    respond_to do |format|
      format.html { redirect_to sampling_types_url, notice: 'Sampling type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sampling_type
      @sampling_type = SamplingType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sampling_type_params
      params.require(:sampling_type).permit(:nombre)
    end
end
