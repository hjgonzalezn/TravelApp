class CreateActividads < ActiveRecord::Migration
  def change
    create_table :actividads do |t|
      t.string :actv_nombre
      t.string :actv_estado_registro

      t.timestamps
    end
  end
end
