json.array!(@approved_appointments) do |approved_appointment|
  json.extract! approved_appointment, :id, :lecturer_id, :student_id, :appointment_time, :appointment_date, :note
  json.url approved_appointment_url(approved_appointment, format: :json)
end
