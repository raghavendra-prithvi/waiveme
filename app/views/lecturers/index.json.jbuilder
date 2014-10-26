json.array!(@lecturers) do |lecturer|
  json.extract! lecturer, :id, :name, :department_id, :available_hrs, :status
  json.url lecturer_url(lecturer, format: :json)
end
