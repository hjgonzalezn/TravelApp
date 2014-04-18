class AddDivisionTerritorialToEntidadTerritorial < ActiveRecord::Migration
  def change
    add_reference :entidad_territorials, :division_territorial, index: true
  end
end
