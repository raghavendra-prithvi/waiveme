json.array!(@departments) do |department|
  json.extract! department, :id, :name, :location
  json.url department_url(department, format: :json)
end
