json.array!(@fotos) do |foto|
  json.extract! foto, :foto_nombre, :foto_titulo, :foto_descripcion, :foto_categoria, :foto_llave_externa
  json.url foto_url(foto, format: :json)
end
