class LoginsController < ApplicationController
  before_action :set_login, only: [:show, :edit, :update, :destroy]

  # GET /logins
  # GET /logins.json
  def index
    @logins = Login.all
  end

  # GET /logins/1
  # GET /logins/1.json
  def show
  end

  # GET /logins/new
  def new
    @login = Login.new
  end

  # GET /logins/1/edit
  def edit
  end

  def login
    @l = Login.where(:clid => params[:clid]).first
    status = {}
    @role = Student.where(:clid => params[:clid]).first
    
    if(@role.nil?)
      @role = Lecturer.where(:clid => params[:clid]).first
    end  
    
    if(@l.password == params[:password])
      status["success"] = true
      status["role"] = @role.class.name
    else
      status["success"] = false
    end  
    render :json => status.to_json
  end
  
    
    def login_create
      @l = Login.new
      @l.clid= params[:clid]
      @l.password = params[:password]
      @l.save
      render :json => @l.to_json
    end
  
  # POST /logins
  # POST /logins.json
  def create
    @login = Login.new
    @login.clid = params[:login][:clid]
    @login.password = params[:login][:password]
    respond_to do |format|
      if @login.save
        format.html { redirect_to @login, notice: 'Login was successfully created.' }
        format.json { render action: 'show', status: :created, location: @login }
      else
        format.html { render action: 'new' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logins/1
  # PATCH/PUT /logins/1.json
  def update
    @login.clid = params[:login][:clid]
    @login.password = params[:login][:password]
    respond_to do |format|
      if @login.save
        format.html { redirect_to @login, notice: 'Login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    @login.destroy
    respond_to do |format|
      format.html { redirect_to logins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params.require(:login).permit(:clid, :password)
    end
end
