class FasesController < ApplicationController
  before_action :set_fase, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /fases
  # GET /fases.json
  def index
    @fases = Fase.all
  end

  # GET /fases/1
  # GET /fases/1.json
  def show
  end

  # GET /fases/new
  def new
    @fase = Fase.new
  end

  # GET /fases/1/edit
  def edit
  end

  # POST /fases
  # POST /fases.json
  def create
    @fase = Fase.new(fase_params)

    respond_to do |format|
      if @fase.save
        format.html { redirect_to @fase, notice: 'Fase was successfully created.' }
        format.json { render :show, status: :created, location: @fase }
      else
        format.html { render :new }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  def newfase
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      fase_type_id = params[:fase_type_id]
      sampling_id = params[:sampling_id]
      p = 0
      q = 0
      z = 0
      error = 0
      extraFlag = params[:extraFlag]
      @fase= Fase.new(p: p, q: q, error: error, z: z, sampling_id: sampling_id, fase_type_id: fase_type_id, extraFlag: extraFlag)
      respond_to do |format|
        if @fase.save
          format.html { redirect_to @fase, notice: 'Fase was successfully created.' }
          format.json { render :newfase, status: :created, location: @fase }
        else
          format.html { render :new }
          format.json { render json: @fase.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @fase = Fase.new()
        format.html { render :new }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  def getfase
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      fase_type_id = params[:fase_type_id]
      sampling_id = params[:sampling_id]
      @fase= Fase.where("sampling_id = ? AND fase_type_id = ?", sampling_id, fase_type_id)
    else
      respond_to do |format|
        @fase = Fase.new()
        format.html { render :new }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  def getfasebyid
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      id = params[:id]
      @fase= Fase.find(id)
    else
      respond_to do |format|
        @fase = Fase.new()
        format.html { render :new }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  def addpq
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @fase = nil
      @fase = Fase.find(params[:id])
      if @fase != nil
        p = params[:p] + @fase[:p]
        q = params[:q] + @fase[:q]
        respond_to do |format|
          if @fase.update_columns(p: p, q: q)
            format.html { redirect_to @fase, notice: 'Fase was successfully updated.' }
            format.json { render :addpq, status: :ok, location: @fase }
          else
            format.html { render :edit }
            format.json { render json: @fase.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @fase.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  def updateflag
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @fase = Fase.find(params[:id])
      respond_to do |format|
        extraFlag = params[:extraFlag]
        if @fase.update_column(:extraFlag, extraFlag)
          format.html { redirect_to @fase, notice: 'Fase was successfully updated.' }
          format.json { render :updateflag, status: :ok, location: @fase }
        else
          format.html { render :show }
          format.json { render json: @fase.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @fase = Fase.new()
        format.html { render :show }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  def updateerrorz
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @fase = Fase.find(params[:id])
      respond_to do |format|
        error = params[:error]
        z = params[:z]
        if @fase.update_columns(z: z, error: error)
          format.html { redirect_to @fase, notice: 'Fase was successfully updated.' }
          format.json { render :updateerrorz, status: :ok, location: @fase }
        else
          format.html { render :show }
          format.json { render json: @fase.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @fase = Fase.new()
        format.html { render :show }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  def updateerror
    @user = nil
    User.all.each do |usu|
      if usu.token == params[:token]
        @user = usu
      end
    end
    if @user != nil
      @fase = Fase.find(params[:id])
      respond_to do |format|
        error = params[:error]
        if @fase.update_column(:error, error)
          format.html { redirect_to @fase, notice: 'Fase was successfully updated.' }
          format.json { render :updateerror, status: :ok, location: @fase }
        else
          format.html { render :show }
          format.json { render json: @fase.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @fase = Fase.new()
        format.html { render :show }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
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
      fase_type_id = params[:fase_type_id]
      sampling_id = params[:sampling_id]
      p = params[:p]
      q = params[:q]
      z = params[:z]
      error = params[:error]
      extraFlag = params[:extraFlag]
      @fase= Fase.new(p: p, q: q, error: error, z: z, sampling_id: sampling_id, fase_type_id: fase_type_id, extraFlag: extraFlag)
      respond_to do |format|
        if @fase.save
          format.html { redirect_to @fase, notice: 'Fase was successfully created.' }
          format.json { render :changefase, status: :created, location: @fase }
        else
          format.html { render :new }
          format.json { render json: @fase.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @fase = Fase.new()
        format.html { render :new }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fases/1
  # PATCH/PUT /fases/1.json
  def update
    respond_to do |format|
      if @fase.update(fase_params)
        format.html { redirect_to @fase, notice: 'Fase was successfully updated.' }
        format.json { render :show, status: :ok, location: @fase }
      else
        format.html { render :edit }
        format.json { render json: @fase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fases/1
  # DELETE /fases/1.json
  def destroy
    @fase.destroy
    respond_to do |format|
      format.html { redirect_to fases_url, notice: 'Fase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fase
      @fase = Fase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fase_params
      params.require(:fase).permit(:p, :q, :error, :z)
    end
end
