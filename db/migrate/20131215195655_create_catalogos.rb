class CreateCatalogos < ActiveRecord::Migration
  def change
    create_table :catalogos do |t|
      t.string :ctlg_categoria
      t.string :ctlg_subcategoria
      t.string :ctlg_valor_cdg
      t.string :ctlg_valor_desc
      t.string :ctlg_observacion
      t.string :ctlg_estado_registro

      t.timestamps
    end
  end
end
