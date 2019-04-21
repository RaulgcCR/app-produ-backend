class OperatorRegistersController < ApplicationController
  before_action :set_operator_register, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /operator_registers
  # GET /operator_registers.json
  def index
    @operator_registers = OperatorRegister.all
  end

  # GET /operator_registers/1
  # GET /operator_registers/1.json
  def show
  end

  # GET /operator_registers/new
  def new
    @operator_register = OperatorRegister.new
  end

  def newregister
    @user = nil
    @registers = params[:registers]
    User.all.each do |usu|
      if usu.token == @registers[0].token
        @user = usu
      end
    end
    if @user != nil
      @registers.each do |reg|
        path_id = reg.path_id
        activity_id = reg.activity_id
        @register= OperatorRegister.new(path_id: path_id, activity_id: activity_id)
        respond_to do |format|
          if @register.save
            format.html { redirect_to @register, notice: 'Operator Register was successfully created.' }
            format.json { render :newregister, status: :created, location: @register }
          else
            format.html { render :new }
            format.json { render json: @register.errors, status: :unprocessable_entity }
          end
        end
      end
      
    else
      respond_to do |format|
        @register = OperatorRegister.new()
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /operator_registers/1/edit
  def edit
  end

  # POST /operator_registers
  # POST /operator_registers.json
  def create
    @operator_register = OperatorRegister.new(operator_register_params)

    respond_to do |format|
      if @operator_register.save
        format.html { redirect_to @operator_register, notice: 'Operator register was successfully created.' }
        format.json { render :show, status: :created, location: @operator_register }
      else
        format.html { render :new }
        format.json { render json: @operator_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operator_registers/1
  # PATCH/PUT /operator_registers/1.json
  def update
    respond_to do |format|
      if @operator_register.update(operator_register_params)
        format.html { redirect_to @operator_register, notice: 'Operator register was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator_register }
      else
        format.html { render :edit }
        format.json { render json: @operator_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operator_registers/1
  # DELETE /operator_registers/1.json
  def destroy
    @operator_register.destroy
    respond_to do |format|
      format.html { redirect_to operator_registers_url, notice: 'Operator register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator_register
      @operator_register = OperatorRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_register_params
      params.fetch(:operator_register, {})
    end
end
