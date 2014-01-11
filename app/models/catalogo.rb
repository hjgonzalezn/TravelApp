class Catalogo < ActiveRecord::Base
  validates :ctlg_categoria, presence: {message: "=> Es un dato requerido"}, length: { in: 5..100, too_short: "=> La categoria debe tener entre 5 y 100 caracteres", too_long:"=> La categoria debe tener entre 5 y 100 caracteres"}
  validates :ctlg_subcategoria, length: { in: 0..100, too_short: "=> La subcategoria debe tener entre 0 y 100 caracteres", too_long:"=> La subcategoria debe tener entre 0 y 100 caracteres"}
  validates :ctlg_valor_cdg, presence: {message: "=> Es un dato reuqerido"}, length: { in: 1..20, too_short: "=> El codigo debe tener entre 1 y 20 caracteres", too_long: "=> El codigo debe tener entre 1 y 20 caracteres"}
  validates :ctlg_estado_registro, presence: {message: "=> Es un dato requerido"}, length: { is: 1 }, inclusion: { in: %w(A E), message: "=> %{value} no es un estado valido" } 
end
