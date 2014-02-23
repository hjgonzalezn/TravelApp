class RemoveModeloAccionFromControls < ActiveRecord::Migration
  def change
    remove_index :controls, name: :index_controls_on_accion_id
    remove_index :controls, name: :index_controls_on_modelo_id
    remove_column :controls, :modelo_id, :number
    remove_column :controls, :accion_id, :number
  end
end
