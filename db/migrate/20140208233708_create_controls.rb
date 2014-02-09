class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.string :ctrl_descripcion
      t.string :ctrl_html_id
      t.string :ctrl_tipo
      t.references :modelo, index: true
      t.references :accion, index: true

      t.timestamps
    end
  end
end
