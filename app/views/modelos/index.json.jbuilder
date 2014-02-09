json.array!(@modelos) do |modelo|
  json.extract! modelo, :mdl_codigo, :mdl_nombre, :mdl_estado_registro
  json.url modelo_url(modelo, format: :json)
end
