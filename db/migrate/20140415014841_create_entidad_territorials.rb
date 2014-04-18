class CreateEntidadTerritorials < ActiveRecord::Migration
  def change
    create_table :entidad_territorials do |t|
      t.string :enter_nombre_oficial
      t.text :enter_presentacion
      t.integer :enter_padre
      t.integer :enter_nivel
      t.string :enter_estado_registro
      t.references :region, index: true

      t.timestamps
    end
  end
end
