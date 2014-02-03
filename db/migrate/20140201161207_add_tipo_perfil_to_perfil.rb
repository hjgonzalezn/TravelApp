class AddTipoPerfilToPerfil < ActiveRecord::Migration
  def change
    add_column :perfils, :prf_tipo_perfil, :string
  end
end
