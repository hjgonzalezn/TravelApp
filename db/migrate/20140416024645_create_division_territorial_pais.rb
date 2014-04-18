class CreateDivisionTerritorialPais < ActiveRecord::Migration
  def change
    create_table :division_territorial_pais do |t|
      t.references :entidad_territorial, index: true
      t.references :division_territorial, index: true
      t.integer :dte_nivel
      t.string :dte_estado_registro

      t.timestamps
    end
  end
end
