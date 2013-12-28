json.array!(@perfils) do |perfil|
  json.extract! perfil, :prf_nombre, :prf_descripcion, :prf_estado_registro
  json.url perfil_url(perfil, format: :json)
end
