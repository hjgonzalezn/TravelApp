class CreatePaqueteTuristicos < ActiveRecord::Migration
  def change
    create_table :paquete_turisticos do |t|
      t.string :pqt_nombre
      t.integer :pqt_tipo_paquete
      t.integer :pqt_tipo_destino
      t.text :pqt_descripcion
      t.text :pqt_cobertura_servicios
      t.text :pqt_condiciones
      t.text :pqt_observacion

      t.timestamps
    end
  end
end
