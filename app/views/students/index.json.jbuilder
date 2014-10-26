json.array!(@students) do |student|
  json.extract! student, :id, :name, :clid, :email, :password
  json.url student_url(student, format: :json)
end
