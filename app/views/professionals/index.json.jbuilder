json.array!(@professionals) do |professional|
  json.extract! professional, :id, :name, :email, :job_location, :job_title, :phone_number, :password_digest
  json.url professional_url(professional, format: :json)
end
