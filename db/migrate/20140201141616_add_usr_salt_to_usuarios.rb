class AddUsrSaltToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :usr_salt, :string
    add_index :usuarios, :usr_nro_docum_ident, :unique => true
    add_index :usuarios, :usr_nombres
    add_index :usuarios, :usr_apellidos
    add_index :usuarios, :usr_correo_electronico, :unique => true
  end
end
