json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :lecturer_id, :student_id, :appointment_time, :appointment_date, :note,:student_clid
  json.url appointment_url(appointment, format: :json)
end
