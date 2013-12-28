class Perfil < ActiveRecord::Base
  validates :prf_nombre, presence: {message: "=> Es un dato obligatorio"}, length: { in: 5..100, too_short: "=> El nombre del perfil debe tener entre 5 y 100 caracteres", too_long:"=> El nombre del perfil debe tener entre 5 y 100 caracteres"}
  validates :prf_descripcion, presence: {message: "=> Es un dato obligatorio"}, length: { in: 5..200, too_short: "=> La descripcion del perfil debe tener entre 5 y 200 caracteres", too_long: "=> La descripcion del perfil debe tener entre 5 y 200 caracteres"}
  validates :prf_estado_registro, presence: {message: "=> Es un dato obligatorio"}, length: { is: 1 }, inclusion: { in: %w(A E), message: "=> %{value} no es un estado valido" }
end
