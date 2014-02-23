class CreateFuncionalidads < ActiveRecord::Migration
  def change
    create_table :funcionalidads do |t|
      t.string :func_descripcion
      t.string :func_publica
      t.integer :func_padre

      t.timestamps
    end
  end
end
