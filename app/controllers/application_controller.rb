class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :menu_options
  
  @accesos = []
  
  def permisos_perfil
    func_permitidas = FuncionControl.select("modelo_id, accion_id").joins("INNER JOIN Funcionalidads ON Funcionalidads.id = Funcion_Controls.funcionalidad_id " + 
                                                                          "INNER JOIN Permisos ON Permisos.funcionalidad_id = Funcion_Controls.funcionalidad_id").where(" permisos.perfil_id = 5 ")
  end
  
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
        
        # if t.mnu_etiqueta_html == "li" then
          # if t.modelo_id != nil and t.accion_id != nil then
            # if @accesos.include?(t.modelo_id.to_s + "-" + t.accion_id.to_s) then
               @menu << line
            # end
          # end
        # end
        
        walktree(t)
      end
      @menu << "</" + db.mnu_etiqueta_html + ">"
    else
      
      @menu << "</" + db.mnu_etiqueta_html + ">" 

    end
  end
  
  # recursive method for generating the dynamic menu
  def menu_options
    @menu = []
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
      @menu << line
      walktree(t)
      @menu << "</" + t.mnu_etiqueta_html + ">"
    end
  end
end
