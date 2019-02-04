json.extract! user, :id, :nombre, :apellido1, :apellido2, :correo, :password, :token, :created_at, :updated_at
json.url user_url(user, format: :json)
