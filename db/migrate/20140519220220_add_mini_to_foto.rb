class AddMiniToFoto < ActiveRecord::Migration
  def change
    add_column :fotos, :foto_mini, :string
  end
end
