class AddEntidadTerritorialToRegion < ActiveRecord::Migration
  def change
    add_reference :regions, :entidad_territorial, index: true
  end
end
