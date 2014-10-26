class ApprovedAppointmentsController < ApplicationController
  before_action :set_approved_appointment, only: [:show, :edit, :update, :destroy]

  # GET /approved_appointments
  # GET /approved_appointments.json
  def index
    @approved_appointments = ApprovedAppointment.all
  end

  # GET /approved_appointments/1
  # GET /approved_appointments/1.json
  def show
  end

  # GET /approved_appointments/new
  def new
    @approved_appointment = ApprovedAppointment.new
  end

  # GET /approved_appointments/1/edit
  def edit
  end

  # POST /approved_appointments
  # POST /approved_appointments.json
  def create
    @approved_appointment = ApprovedAppointment.new(approved_appointment_params)

    respond_to do |format|
      if @approved_appointment.save
        format.html { redirect_to @approved_appointment, notice: 'Approved appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @approved_appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @approved_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approved_appointments/1
  # PATCH/PUT /approved_appointments/1.json
  def update
    respond_to do |format|
      if @approved_appointment.update(approved_appointment_params)
        format.html { redirect_to @approved_appointment, notice: 'Approved appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @approved_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approved_appointments/1
  # DELETE /approved_appointments/1.json
  def destroy
    @approved_appointment.destroy
    respond_to do |format|
      format.html { redirect_to approved_appointments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approved_appointment
      @approved_appointment = ApprovedAppointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approved_appointment_params
      params.require(:approved_appointment).permit(:lecturer_id, :student_id, :appointment_time, :appointment_date, :note)
    end
end
