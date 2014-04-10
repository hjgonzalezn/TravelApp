require 'bcrypt'

class Usuario < ActiveRecord::Base
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
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
      self.usr_salt = BCrypt::Engine.generate_salt
      #self.usr_contrasena= BCrypt::Engine.hash_secret(usr_contrasena, self.usr_salt)
    end
  end
  
  def self.authenticate(usr_correo_electronico_in = "", usr_contrasena_in = "")
    if EMAIL_REGEX.match(usr_correo_electronico_in) then
      usuario = Usuario.find_by usr_correo_electronico: usr_correo_electronico_in 
    end
    
    unless usuario.nil? then
    if usuario.match_password(usr_contrasena_in) then
         return usuario
    else
      return false
    end
    else
      return false
    end
  end
  
  def match_password(usr_contrasena_in)
    self.usr_contrasena == usr_contrasena_in #BCrypt::Engine.hash_secret(usr_contrasena_in, self.usr_salt)
    #puts "CLAVE 1" + self.usr_contrasena
    #puts "CLAVE 2" + BCrypt::Engine.hash_secret(usr_contrasena_in, self.usr_salt)
  end
  
end
