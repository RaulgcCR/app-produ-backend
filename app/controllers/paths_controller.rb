class PathsController < ApplicationController
  before_action :set_path, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /paths
  # GET /paths.json
  def index
    @paths = Path.all
  end

  # GET /paths/1
  # GET /paths/1.json
  def show
  end

  # GET /paths/new
  def new
    @path = Path.new
  end

  def dates
    @pathsDates = Path.select(:fecha).where("sampling_id = ?", sampling_id)
  end

  def datepaths
    @user = nil
    date = params[:fecha]
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @paths = Path.where(fecha: date)
    end
  end

  def newpath
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      cantOperarios = params[:cantOperarios]
      temperatura = params[:temperatura]
      humedad = params[:humedad]
      fecha = params[:fecha]
      hora = params[:hora]
      comentario = params[:comentario]
      fase_id = params[:fase_id]
      sampling_id = params[:sampling_id]
      @path= Path.new(cantOperarios: cantOperarios, temperatura: temperatura, humedad: humedad, fecha: fecha, hora: hora, comentario: comentario, fase_id: fase_id, sampling_id: sampling_id)
      respond_to do |format|
        if @path.save
          format.html { redirect_to @path, notice: 'Path was successfully created.' }
          format.json { render :newpath, status: :created, location: @path }
        else
          format.html { render :new }
          format.json { render json: @path.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @path = Path.new()
        format.html { render :new }
        format.json { render json: @path.errors, status: :unprocessable_entity }
      end
    end
  end


  def newcomment
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      name = params[:nombre]
      lastname = params[:primerapellido]
      secondlastname = params[:segundoapellido]
      mail= params[:correo]
      pwd= params[:password]
      image= params[:foto]
      @path = User.find(params[:id])
      respond_to do |format|
        if @path.update(comentario: params[:comentario])
          format.html { redirect_to @path, notice: 'User was successfully updated.' }
          format.json { render :newcomment, status: :ok, location: @path }
        else
          format.html { render :show }
          format.json { render json: @path.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @path = Path.new()
        format.html { render :show }
        format.json { render json: @path.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /paths/1/edit
  def edit
  end

  # POST /paths
  # POST /paths.json
  def create
    @path = Path.new(path_params)

    respond_to do |format|
      if @path.save
        format.html { redirect_to @path, notice: 'Path was successfully created.' }
        format.json { render :show, status: :created, location: @path }
      else
        format.html { render :new }
        format.json { render json: @path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paths/1
  # PATCH/PUT /paths/1.json
  def update
    respond_to do |format|
      if @path.update(path_params)
        format.html { redirect_to @path, notice: 'Path was successfully updated.' }
        format.json { render :show, status: :ok, location: @path }
      else
        format.html { render :edit }
        format.json { render json: @path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paths/1
  # DELETE /paths/1.json
  def destroy
    @path.destroy
    respond_to do |format|
      format.html { redirect_to paths_url, notice: 'Path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_path
      @path = Path.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def path_params
      params.require(:path).permit(:cantOperarios, :temperatura, :humedad, :fecha, :hora, :comentario)
    end
end
