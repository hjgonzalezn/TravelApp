json.array!(@catalogos) do |catalogo|
  json.extract! catalogo, :ctlg_categoria, :ctlg_subcategoria, :ctlg_valor_cdg, :ctlg_valor_desc, :ctlg_observacion, :ctlg_estado_registro
  json.url catalogo_url(catalogo, format: :json)
end
