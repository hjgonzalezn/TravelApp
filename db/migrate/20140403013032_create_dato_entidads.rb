class CreateDatoEntidads < ActiveRecord::Migration
  def change
    create_table :dato_entidads do |t|
      t.string :ent_dato_categoria
      t.string :ent_dato_codigo
      t.string :ent_dato_descripcion
      t.text :ent_dato_valor
      t.string :ent_dato_estado_registro

      t.timestamps
    end
  end
end
