class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :prf_nombre
      t.string :prf_descripcion
      t.string :prf_estado_registro

      t.timestamps
    end
  end
end
