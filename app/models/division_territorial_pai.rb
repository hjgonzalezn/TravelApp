class DivisionTerritorialPai < ActiveRecord::Base
  belongs_to :entidad_territorial
  belongs_to :division_territorial
end
