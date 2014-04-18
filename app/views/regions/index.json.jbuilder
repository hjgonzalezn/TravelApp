json.array!(@regions) do |region|
  json.extract! region, :reg_nombre, :reg_descripcion, :reg_estado_registro
  json.url region_url(region, format: :json)
end
