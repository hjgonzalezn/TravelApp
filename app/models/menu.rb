class Menu < ActiveRecord::Base
  belongs_to :modelo
  belongs_to :accion
end
