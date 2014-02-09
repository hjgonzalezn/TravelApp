json.array!(@accions) do |accion|
  json.extract! accion, :acc_codigo, :acc_nombre, :acc_estado_registro
  json.url accion_url(accion, format: :json)
end
