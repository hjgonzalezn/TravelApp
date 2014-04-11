class CreateParametroSistemas < ActiveRecord::Migration
  def change
    create_table :parametro_sistemas do |t|
      t.string :psis_categoria
      t.string :psis_codigo
      t.string :psis_valor
      t.string :psis_descripcion
      t.string :psis_estado_registro

      t.timestamps
    end
  end
end
