json.array!(@parametro_sistemas) do |parametro_sistema|
  json.extract! parametro_sistema, :psis_categoria, :psis_codigo, :psis_valor, :psis_descripcion, :psis_estado_registro
  json.url parametro_sistema_url(parametro_sistema, format: :json)
end
