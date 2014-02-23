json.array!(@funcion_controls) do |funcion_control|
  json.extract! funcion_control, :funcionalidad_id, :modelo_id, :accion_id, :control_id
  json.url funcion_control_url(funcion_control, format: :json)
end
