json.array!(@division_territorial_pais) do |division_territorial_pai|
  json.extract! division_territorial_pai, :entidad_territorial_id, :division_territorial_id, :dte_nivel, :dte_estado_registro
  json.url division_territorial_pai_url(division_territorial_pai, format: :json)
end
