class AddSubcategoryObservacionToDatoEntidads < ActiveRecord::Migration
  def change
    add_column :dato_entidads, :ent_dato_subcategoria, :string
    add_column :dato_entidads, :ent_dato_observacion, :string
  end
end
