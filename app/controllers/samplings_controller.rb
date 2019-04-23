class SamplingsController < ApplicationController
  before_action :set_sampling, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /samplings
  # GET /samplings.json
  def index
    @samplings = Sampling.all
  end

  # GET /samplings/1
  # GET /samplings/1.json
  def show
  end

  # GET /samplings/new
  def new
    @sampling = Sampling.new
  end

  # GET /samplings/1/edit
  def edit
  end

  # POST /samplings
  # POST /samplings.json
  def create
    @sampling = Sampling.new(sampling_params)

    respond_to do |format|
      if @sampling.save
        format.html { redirect_to @sampling, notice: 'Sampling was successfully created.' }
        format.json { render :show, status: :created, location: @sampling }
      else
        format.html { render :new }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  def newsampling
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      nombre = params[:nombre]
      cantMuestras = params[:cantMuestras]
      cantMuestrasTotal = params[:cantMuestrasTotal]
      descripcion = params[:descripcion]
      fase = params[:fase]
      project_id = params[:project_id]
      sampling_type_id = params[:sampling_type_id]
      muestrasActual = params[:muestrasActual]
      tok= createToken()
      @sampling= Sampling.new(nombre: nombre, cantMuestras: cantMuestras, cantMuestrasTotal: cantMuestrasTotal, descripcion: descripcion, fase: fase, project_id: project_id, sampling_type_id: sampling_type_id, muestrasActual: muestrasActual)
      respond_to do |format|
        if @sampling.save
          format.html { redirect_to @sampling, notice: 'Sampling was successfully created.' }
          format.json { render :newsampling, status: :created, location: @sampling }
        else
          format.html { render :new }
          format.json { render json: @sampling.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @sampling = Sampling.new()
        format.html { render :new }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  def projectsamplings
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @samplings = Sampling.where(project_id: params[:id])
    end
  end

  def addsamplings
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @sampling = nil
      @sampling = Sampling.find(params[:id])
      if @sampling != nil
        muestrasActual = params[:muestrasActual] + @sampling[:muestrasActual]
        respond_to do |format|
          if @sampling.update_column(:muestrasActual, muestrasActual)
            format.html { redirect_to @sampling, notice: 'Fase was successfully updated.' }
            format.json { render :show, status: :ok, location: @sampling }
          else
            format.html { render :edit }
            format.json { render json: @sampling.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @sampling.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  def changefase
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @sampling = Sampling.find(params[:id])
      respond_to do |format|
        fase = params[:fase]
        if @sampling.update_column(:fase, fase)
          format.html { redirect_to @sampling, notice: 'Sampling was successfully updated.' }
          format.json { render :changefase, status: :ok, location: @sampling }
        else
          format.html { render :show }
          format.json { render json: @sampling.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @sampling = Sampling.new()
        format.html { render :show }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  def addmoresamplings
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @sampling = Sampling.find(params[:id])
      respond_to do |format|
        cantMuestrasP = params[:cantMuestras]
        cantMuestrasTotalP = params[:cantMuestrasTotal]
        cantMuestras = @sampling[:cantMuestras] + cantMuestrasP
        cantMuestrasTotal = @sampling[:cantMuestrasTotal] + cantMuestrasTotalP
        if @sampling.update_columns(cantMuestras: cantMuestras, cantMuestrasTotal: cantMuestrasTotal)
          format.html { redirect_to @sampling, notice: 'Sampling was successfully updated.' }
          format.json { render :addmoresamplings, status: :ok, location: @sampling }
        else
          format.html { render :show }
          format.json { render json: @sampling.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @sampling = Sampling.new()
        format.html { render :show }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  def getsampling
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @sampling = Sampling.find(params[:id])
    else
      respond_to do |format|
        @sampling = Sampling.new()
        format.html { render :show }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /samplings/1
  # PATCH/PUT /samplings/1.json
  def update
    respond_to do |format|
      if @sampling.update(sampling_params)
        format.html { redirect_to @sampling, notice: 'Sampling was successfully updated.' }
        format.json { render :show, status: :ok, location: @sampling }
      else
        format.html { render :edit }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samplings/1
  # DELETE /samplings/1.json
  def destroy
    @sampling.destroy
    respond_to do |format|
      format.html { redirect_to samplings_url, notice: 'Sampling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sampling
      @sampling = Sampling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sampling_params
      params.require(:sampling).permit(:nombre, :cantMuestras, :cantMuestrasTotal, :descripcion, :fase)
    end
end
