class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]

  # GET /lecturers
  # GET /lecturers.json
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/1
  # GET /lecturers/1.json
  def show
  end

  # GET /lecturers/new
  def new
    @lecturer = Lecturer.new
    @departments = Department.all
  end

  # GET /lecturers/1/edit
  def edit
    @departments = Department.all
  end

  # POST /lecturers
  # POST /lecturers.json
  def create
    @lecturer = Lecturer.new
    @lecturer.name = params[:lecturer][:name]
    @lecturer.department_id = params[:lecturer][:department_id]
    @lecturer.status = params[:lecturer][:status]
    @lecturer.available_hrs = params[:lecturer][:available_hrs]
    @lecturer.clid = params[:lecturer][:clid]
    
    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lecturer }
      else
        format.html { render action: 'new' }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def details
    @l = Lecturer.find(params[:lecturer_id])
    render :json => @l.to_json    
  end
  
  def details_clid
    @l = Lecturer.where(:clid =>params[:clid]).first
    if !@l.nil?
      render :json => @l.to_json  
    else
      render :text => "there is no lecturer with this clid"
    end
  end
  
  def appointments
    @l = Lecturer.where(:clid => params[:clid]).first
    @aps = Appointment.where(:lecturer_id => @l.id)
    render :json => @aps.to_json
  end
  
  def modify_appointment
    @ap = Appointment.find(params[:appointment_id])
    @ap.note += params[:note].to_s
    if(!params[:approved].blank?)
      @ap.approved = params[:approved]    
    end
    @ap.save
    render :json => @ap.to_json
  end
  
  # PATCH/PUT /lecturers/1
  # PATCH/PUT /lecturers/1.json
  def update
    @lecturer.name = params[:lecturer][:name]
    @lecturer.department_id = params[:lecturer][:department_id]
    @lecturer.status = params[:lecturer][:status]
    @lecturer.available_hrs = params[:lecturer][:available_hrs]
    @lecturer.clid = params[:lecturer][:clid]
    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturers/1
  # DELETE /lecturers/1.json
  def destroy
    @lecturer.destroy
    respond_to do |format|
      format.html { redirect_to lecturers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecturer_params
      params.require(:lecturer).permit(:name, :department_id, :available_hrs, :status)
    end
end
