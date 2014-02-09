json.array!(@controls) do |control|
  json.extract! control, :ctrl_descripcion, :ctrl_html_id, :ctrl_tipo, :modelo_id, :accion_id
  json.url control_url(control, format: :json)
end
