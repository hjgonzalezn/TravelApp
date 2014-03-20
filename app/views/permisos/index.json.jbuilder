json.array!(@permisos) do |permiso|
  json.extract! permiso, :perfil_id, :funcionalidad_id
  json.url permiso_url(permiso, format: :json)
end
