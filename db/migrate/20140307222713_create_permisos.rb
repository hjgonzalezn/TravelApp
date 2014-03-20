class CreatePermisos < ActiveRecord::Migration
  def change
    create_table :permisos do |t|
      t.references :perfil, index: true
      t.references :funcionalidad, index: true

      t.timestamps
    end
  end
end
