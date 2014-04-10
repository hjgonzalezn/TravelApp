json.array!(@dato_entidads) do |dato_entidad|
  json.extract! dato_entidad, :ent_dato_categoria, :ent_dato_codigo, :ent_dato_descripcion, :ent_dato_valor, :ent_dato_estado_registro
  json.url dato_entidad_url(dato_entidad, format: :json)
end
