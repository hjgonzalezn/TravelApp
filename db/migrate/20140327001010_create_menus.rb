class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :mnu_tipo_elemento
      t.string :mnu_etiqueta_html
      t.string :mnu_clase_css
      t.string :mnu_props_html
      t.text :mnu_texto
      t.integer :mnu_padre
      t.integer :mnu_orden
      t.references :modelo, index: true
      t.references :accion, index: true

      t.timestamps
    end
  end
end
