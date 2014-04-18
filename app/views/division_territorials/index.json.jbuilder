json.array!(@division_territorials) do |division_territorial|
  json.extract! division_territorial, :dvt_nombre, :dvt_estado_registro
  json.url division_territorial_url(division_territorial, format: :json)
end
