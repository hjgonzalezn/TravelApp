json.array!(@actividads) do |actividad|
  json.extract! actividad, :actv_nombre, :actv_estado_registro
  json.url actividad_url(actividad, format: :json)
end
