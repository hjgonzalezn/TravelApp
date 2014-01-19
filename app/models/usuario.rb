require 'bcrypt'

class Usuario < ActiveRecord::Base
  before_save :encrypt_password
  #after_save :clear_password

  belongs_to :perfil
  validate :valida_fecha_nacimiento
  validates :usr_tipo_docum_ident, presence: {message: "=> Es un dato requerido"}
  validates :usr_nro_docum_ident, presence: {message: "=> Es un dato requerido"}, numericality: true, uniqueness:true
  validates :usr_nombres, presence: {message: "=> Es un dato requerido"}, length: { in: 2..40, too_short: "=> Los nombres deben tener entre 2 y 40 caracteres", too_long:"=> Los nombres deben tener entre 2 y 40 caracteres"}
  validates :usr_apellidos, presence: {message: "=> Es un dato requerido"}, length: { in: 2..40, too_short: "=> Los apellidos deben tener entre 2 y 40 caracteres", too_long:"=> Los apellidos deben tener entre 2 y 40 caracteres"}
  validates :usr_correo_electronico, uniqueness: true
  validates :usr_genero, presence: {message: "=> Es un dato requerido"}
  validates :usr_estado, presence: {message: "=> Es un dato requerido"}
  validates :perfil_id, presence: {message: "=> Es un dato requerido"}, numericality: true
  
  def valida_fecha_nacimiento
    if usr_fecha_nacimiento.present? && usr_fecha_nacimiento > Date.today then
      errors.add(:usr_fecha_nacimiento, "La fecha de nacimiento no puede ser posterior a la fecha actual")
    end 
  end
  

  def encrypt_password
    if usr_contrasena.present?
      self.usr_contrasena= BCrypt::Engine.hash_secret(usr_contrasena, BCrypt::Engine.generate_salt)
    end
  end
  
  def clear_password
    self.usr_contrasena = nil
  end
end
