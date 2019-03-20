class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :set_default_response_format


  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.all
    @user.each do |user|
      user = parsearUsuario(user)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def newlog
    puts "Hola a todos!"
    mail = params[:correo]
    pwd = params[:password]
    puts mail
    puts pwd
    valor = User.where(correo: mail, password: pwd)
    @user = valor
    #resources :posts, :defaults => { :format => 'json' }
  end


  def newuser
    
    @user = nil
    @user = User.find_by(correo: params[:correo])
    if @user == nil
      name = params[:nombre]
      lastname = params[:apellido1]
      secondlastname =  params[:apellido2]
      mail=  params[:correo]
      pwd=  params[:password]
      tok= createToken()
      @user= User.new(nombre: name, apellido1: lastname, apellido2: secondlastname, correo: mail, password: pwd, token: tok)
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :new, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @user = User.new()
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def newLogToken
    valor = User.where(token: params[:token])
    valor.each do |parte|
      parte = parsearUsuario(parte)
    end
    @user = valor
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def parsearUsuario(user)
    user.nombre = parser(user.nombre)
    user.apellido1 = parser(user.apellido1)
    user.apellido2 = parser(user.apellido2)
    user.correo = parser(user.correo)
    user.password = parser(user.password)
    return user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user][:token] = createToken()
      params.require(:user).permit(:nombre, :apellido1, :apellido2, :correo, :password, :token)
    end

  protected
      def set_default_response_format
        request.format = :json
      end
end
