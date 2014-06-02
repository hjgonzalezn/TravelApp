json.array!(@paquete_turisticos) do |paquete_turistico|
  json.extract! paquete_turistico, :pqt_nombre, :pqt_tipo_paquete, :pqt_tipo_destino, :pqt_descripcion, :pqt_cobertura_servicios, :pqt_condiciones, :pqt_observacion
  json.url paquete_turistico_url(paquete_turistico, format: :json)
end
