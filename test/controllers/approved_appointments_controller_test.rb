require 'test_helper'

class ApprovedAppointmentsControllerTest < ActionController::TestCase
  setup do
    @approved_appointment = approved_appointments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:approved_appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create approved_appointment" do
    assert_difference('ApprovedAppointment.count') do
      post :create, approved_appointment: { appointment_date: @approved_appointment.appointment_date, appointment_time: @approved_appointment.appointment_time, lecturer_id: @approved_appointment.lecturer_id, note: @approved_appointment.note, student_id: @approved_appointment.student_id }
    end

    assert_redirected_to approved_appointment_path(assigns(:approved_appointment))
  end

  test "should show approved_appointment" do
    get :show, id: @approved_appointment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @approved_appointment
    assert_response :success
  end

  test "should update approved_appointment" do
    patch :update, id: @approved_appointment, approved_appointment: { appointment_date: @approved_appointment.appointment_date, appointment_time: @approved_appointment.appointment_time, lecturer_id: @approved_appointment.lecturer_id, note: @approved_appointment.note, student_id: @approved_appointment.student_id }
    assert_redirected_to approved_appointment_path(assigns(:approved_appointment))
  end

  test "should destroy approved_appointment" do
    assert_difference('ApprovedAppointment.count', -1) do
      delete :destroy, id: @approved_appointment
    end

    assert_redirected_to approved_appointments_path
  end
end
