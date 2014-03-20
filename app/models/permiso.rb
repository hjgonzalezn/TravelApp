class Permiso < ActiveRecord::Base
  belongs_to :perfil
  belongs_to :funcionalidad
end
