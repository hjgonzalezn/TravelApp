class CreateModelos < ActiveRecord::Migration
  def change
    create_table :modelos do |t|
      t.string :mdl_codigo
      t.string :mdl_nombre
      t.string :mdl_estado_registro

      t.timestamps
    end
  end
end
