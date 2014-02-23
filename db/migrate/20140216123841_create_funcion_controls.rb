class CreateFuncionControls < ActiveRecord::Migration
  def change
    create_table :funcion_controls do |t|
      t.references :funcionalidad, index: true
      t.references :modelo, index: true
      t.references :accion, index: true
      t.references :control, index: true

      t.timestamps
    end
  end
end
