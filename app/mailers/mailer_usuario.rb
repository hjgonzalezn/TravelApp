class MailerUsuario < ActionMailer::Base
  default from: "hj.gonzalezn@gmail.com"
  
  def bienvenida_usuario(usuario)
    @usuario = usuario
    mail(to: @usuario.usr_correo_electronico, subject: "Bienvenido", from: "servicioalcliente@naisatours.com")
  end
end
