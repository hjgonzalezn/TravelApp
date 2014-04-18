class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :reg_nombre
      t.text :reg_descripcion
      t.string :reg_estado_registro

      t.timestamps
    end
  end
end
