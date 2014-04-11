class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_perfil, :menu_options, :objetos_permitidos_pantalla, :datos_aplicacion
  
  @accesos = []
  
  #Desarrollado por: Harry Jair Gonzalez Neita
  #Fecha: 10 de Abril de 2014
  #Descripción: Guarda en sesión el codigo del perfil de usuario actual
  def set_perfil
    perfil_id = session[:perfil_id]
    if perfil_id.blank? then
      session[:perfil_id] = set_perfil_default
    end
  end
  
  #Desarrollado por: Harry Jair Gonzalez Neita
  #Fecha: 10 de Abril de 2014
  #Descripción: Retorna las funcionalidades permitidas a un perfil de usuario 
  def permisos_perfil
    perfil_id = session[:perfil_id].to_s
    func_permitidas = FuncionControl.select("modelo_id, accion_id").distinct.joins("INNER JOIN Funcionalidads ON Funcionalidads.id = Funcion_Controls.funcionalidad_id " + 
                                                                          "INNER JOIN Permisos ON Permisos.funcionalidad_id = Funcion_Controls.funcionalidad_id").where(" permisos.perfil_id = " + perfil_id)
  end

  #Desarrollado por: Harry Jair Gonzalez Neita
  #Fecha: 10 de Abril de 2014
  #Descripción: Retorna la relación de objetos a los que tiene acceso un perfil de usuario en una pantalla
  def objetos_permitidos_pantalla
    perfil_id = session[:perfil_id].to_s
    modelo = Modelo.find_by mdl_nombre: controller_name.upcase
    accion = Accion.find_by acc_nombre: action_name.upcase
    # puts "MODELO >>>>>>>>>>>>>"
    # if modelo.nil? then
      # puts "NULO >> " + controller_name.upcase
    # else
      # puts modelo.mdl_nombre + " - " + controller_name.upcase
    # end
#     
    # puts "ACCION >>>>>>>>>>>>>"
    # if accion.nil? then
      # puts "NULA >> " + action_name.upcase
    # else
      # puts accion.acc_nombre + " - " + action_name.upcase
    # end
    unless modelo.nil? or accion.nil? then  
      #puts "ENTRO <<<<<<<<<<<<<<"
      @objetos_permitidos = objetos_permitidos_perfil(perfil_id, modelo.id, accion.id)
    end
  end
  
  #Desarrollado por: Harry Jair Gonzalez Neita
  #Fecha: 10 de Abril de 2014
  #Descripción: Retorna los datos básicos de la entidad requeridos en el arranque de la aplicación 
  def datos_aplicacion
    dato_entidad = DatoEntidad.find_by ent_dato_codigo: :LOGOHDR
    @logo_header = dato_entidad.ent_dato_valor
    dato_entidad = DatoEntidad.find_by ent_dato_codigo: :RAZON_SOCIAL
    @razon_social = dato_entidad.ent_dato_valor
    dato_entidad = DatoEntidad.find_by ent_dato_codigo: :ACTIVID_ECONOM
    @actividad_economica = dato_entidad.ent_dato_valor
    @redes_sociales = DatoEntidad.where("ent_dato_categoria= 'CONTACTO' AND ent_dato_subcategoria = 'REDES SOCIALES'")
    dato_entidad = DatoEntidad.find_by ent_dato_codigo: :EMAIL
    @correo_electronico = dato_entidad.ent_dato_valor
    @telefonos = DatoEntidad.where("ent_dato_categoria= 'CONTACTO' AND ent_dato_subcategoria = 'TELEFONO'")
  end
  
  #Desarrollado por: Harry Jair Gonzalez Neita
  #Fecha: 10 de Abril de 2014
  #Descripción: función recursiva para la construcción del menú
  def walktree(db)
    sub_items = Menu.where(mnu_padre: db.id).order(mnu_orden: :asc)
    if sub_items.count > 0 then
      sub_items.each do |t|
        line = "<" + t.mnu_etiqueta_html
        
        unless t.mnu_clase_css.blank? then
          line = line + " class=\"" + t.mnu_clase_css + "\""
        end
        
        unless t.mnu_props_html.blank? then      
          props_html = t.mnu_props_html.split(" ")
          props_html.each do |l|
            atrib_valor = l.split("=")
            line = line + " " + atrib_valor[0] + "=\"" + atrib_valor[1] + "\""
          end
        end
        
        line = line + ">"
        
        if t.modelo_id != nil and t.accion_id != nil then
          accion = Accion.find(t.accion_id)
          modelo = Modelo.find(t.modelo_id)
          if accion.acc_nombre.downcase == "index" then
            line = line + "<a href=\"http://localhost:3000/#{modelo.mdl_nombre.downcase}"  + "\">" + t.mnu_texto + "</a>"
          else
            line = line + "<a href=\"http://localhost:3000/" + modelo.mdl_nombre.downcase + "/" + accion.acc_nombre.downcase + "\">" + t.mnu_texto + "</a>"
          end
        else
          if t.mnu_etiqueta_html == "li" then
            line = line + "<a href=\"#\">" + t.mnu_texto + "</a>"
          else
            line = line + t.mnu_texto
          end 
        end
        
        if t.mnu_etiqueta_html == "li" then
          if t.modelo_id != nil and t.accion_id != nil then
            if @accesos.include?(t.modelo_id.to_s + "-" + t.accion_id.to_s) then # tiene permiso a esa opcion de menu
               @menu_opc << line
            end
          else
            @menu_opc << line
          end
        else
          @menu_opc << line
        end
        
        walktree(t)
      end
      @menu_opc << "</" + db.mnu_etiqueta_html + ">"
    else
      
      @menu_opc << "</" + db.mnu_etiqueta_html + ">" 
    end
  end
  
  # recursive method for generating the dynamic menu
  def menu_options
    @menu_opc = []
    @accesos = []
    
    func_permitidas = permisos_perfil
    
    func_permitidas.each do |f|
      @accesos << f.modelo_id.to_s + "-" + f.accion_id.to_s
    end
    
    Menu.where("id = 1").each do |t|
      line = "<" + t.mnu_etiqueta_html
      
      unless t.mnu_clase_css.nil? then
        line = line + " class=\"" + t.mnu_clase_css + "\""
      end
    
      props_html = t.mnu_props_html.split(" ")
    
      props_html.each do |l|
        atrib_valor = l.split("=")
        line = line + " " + atrib_valor[0] + "=\"" + atrib_valor[1] + "\""
      end
    
      line = line + ">"
      @menu_opc << line
      walktree(t)
      @menu_opc << "</" + t.mnu_etiqueta_html + ">"
    end
  end
  
end
