class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :usr_tipo_docum_ident
      t.integer :usr_nro_docum_ident
      t.string :usr_nombres
      t.string :usr_apellidos
      t.string :usr_correo_electronico
      t.string :usr_contrasena
      t.string :usr_tipo_contrasena
      t.date :usr_fecha_nacimiento
      t.string :usr_genero
      t.binary :usr_foto
      t.datetime :usr_fch_ultimo_ingreso
      t.string :usr_tipo_cliente
      t.datetime :usr_fecha_ultima_salida
      t.date :usr_fch_vigencia_contrasena
      t.string :usr_estado
      t.references :perfil, index: true

      t.timestamps
    end
  end
end
