json.array!(@funcionalidads) do |funcionalidad|
  json.extract! funcionalidad, :func_descripcion, :func_publica, :func_padre
  json.url funcionalidad_url(funcionalidad, format: :json)
end
