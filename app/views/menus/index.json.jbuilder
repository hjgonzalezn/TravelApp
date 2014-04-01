json.array!(@menus) do |menu|
  json.extract! menu, :mnu_tipo_elemento, :mnu_etiqueta_html, :mnu_clase_css, :mnu_props_html, :mnu_texto, :mnu_padre, :mnu_orden, :modelo_id, :accion_id
  json.url menu_url(menu, format: :json)
end
