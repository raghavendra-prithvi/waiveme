class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  def request_apointment
    @ap = Appointment.new
    @s = Student.where(:clid=> params[:student_id]).first    
    @ap.student_id = @s.id
    @ap.lecturer_id = params[:lecturer_id]
    @ap.appointment_time = params[:appointment_time]
    @ap.appointment_date = params[:appointment_date]
    @ap.note = params[:note]
    status = {}    
    if @ap.save!
      status["success"] = "created successfully" 
    end
    render :json => status.to_json      
  end
  
  
  def request_appointment_clid
      @ap = Appointment.new
      @s = Student.where(:clid=> params[:student_id]).first          
      @lecturer  = Lecturer.where(:clid => params[:lecturer_clid]).first
      @ap.student_id = @s.id    
      @ap.lecturer_id = @lecturer.id #params[:lecturer_id]
      @ap.appointment_time = params[:appointment_time]
      @ap.appointment_date = params[:appointment_date]
      @ap.note = params[:note]
      status = {}    
      if @ap.save!
        status["success"] = "created successfully" 
      end
      render :json => status.to_json      
  end  
  
  
  
  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:lecturer_id, :student_id, :appointment_time, :appointment_date, :note)
    end
end
