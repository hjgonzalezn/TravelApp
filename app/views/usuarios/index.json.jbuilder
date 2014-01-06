json.array!(@usuarios) do |usuario|
  json.extract! usuario, :usr_tipo_docum_ident, :usr_nro_docum_ident, :usr_nombres, :usr_apellidos, :usr_correo_electronico, :usr_contrasena, :usr_tipo_contrasena, :usr_fecha_nacimiento, :usr_genero, :usr_foto, :usr_fch_ultimo_ingreso, :usr_tipo_cliente, :usr_fecha_ultima_salida, :usr_fch_vigencia_contrasena, :usr_estado, :perfil_id
  json.url usuario_url(usuario, format: :json)
end
