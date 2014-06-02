class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :foto_nombre
      t.string :foto_titulo
      t.string :foto_descripcion
      t.string :foto_categoria
      t.integer :foto_llave_externa

      t.timestamps
    end
  end
end
