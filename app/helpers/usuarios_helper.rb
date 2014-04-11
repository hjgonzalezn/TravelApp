module UsuariosHelper
  include ApplicationHelper
  
  def login_attempt(usr_datos_sesion)
    
    array_datos = usr_datos_sesion.split("|")
    usr_email = array_datos[0]
    usr_passwd = array_datos[1]
    
    authorized_user = Usuario.authenticate(usr_email, usr_passwd)
   
    if authorized_user then
        
        session[:usr_correo_electronico] = usr_email
        session[:perfil_id] = authorized_user.perfil_id
        session[:tipo_clave] = authorized_user.usr_tipo_contrasena
        session[:usuario] =  authorized_user.usr_nombres
        
        #format.html {redirect_to new_password_url, notice: 'Apreciado(a) usuario(a): su contrasena ya caduco por favor confirme el cambio de la misma.'}
        @usuario = authorized_user
        @usuario.usr_fch_ultimo_ingreso = Time.now
        @usuario.save # se actualiza la última fecha de ingreso al sistema
        @usuario = nil
        return "OK"
     else
        return "LOGIN FAILED"       
    end
  end
  
  def perfil_default
    perfil = set_perfil_default
  end
  
end
