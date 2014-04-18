json.array!(@entidad_territorials) do |entidad_territorial|
  json.extract! entidad_territorial, :enter_nombre_oficial, :enter_presentacion, :enter_padre, :enter_nivel, :enter_estado_registro, :region_id
  json.url entidad_territorial_url(entidad_territorial, format: :json)
end
