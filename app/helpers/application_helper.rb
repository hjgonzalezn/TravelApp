module ApplicationHelper
 
  def set_estados_registro
    @estados_registro = Catalogo.where("ctlg_categoria = 'ESTADO REGISTRO' AND ctlg_estado_registro = 'A'")
  end
  
  def set_estado_registro_actual(codigo_estado, action_name)
      if action_name == "new" then
        @estado_registro = "A"
      elsif action_name == "show" then
        catalogo = Catalogo.find_by ctlg_categoria: 'ESTADO REGISTRO', ctlg_valor_cdg: codigo_estado
        @estado_registro = catalogo.ctlg_valor_desc
      elsif action_name == "edit" then
        @estado_registro = codigo_estado
      end
    end

  def set_modelos
    modelos = Modelo.where(mdl_estado_registro: :A).order(mdl_nombre: :asc)
  end
  
  def set_acciones
    acciones = Accion.where(acc_estado_registro: :A).order(acc_nombre: :asc)
  end
  
  def set_paises
    @paises = EntidadTerritorial.where("enter_padre BETWEEN 2 AND 6")
  end
  
  def set_territorios_padres(entidad_territorial_id)
    @territorios_superiores = []
    unless entidad_territorial_id.nil?
      entidad_padre = EntidadTerritorial.find(entidad_territorial_id)
    end
    
    unless entidad_padre.nil?
      set_territorios_padres(entidad_padre.enter_padre)
       
      unless entidad_padre.enter_padre.nil?
        @territorios_superiores << entidad_padre.enter_padre 
      end
    end
    return @territorios_superiores
  end
  
  def set_perfil_default
    perfil = ParametroSistema.find_by psis_codigo: :PRFDEF
    perfil_def = perfil.psis_valor
  end
  
  def objetos_permitidos_perfil(perfil_id, modelo_id, accion_id)
    
    joins_tablas = "INNER JOIN Funcion_Controls ON Controls.id = Funcion_Controls.Control_id " +
                   "INNER JOIN Funcionalidads ON Funcionalidads.id = Funcion_Controls.funcionalidad_id " + 
                   "INNER JOIN Permisos ON Permisos.funcionalidad_id = Funcion_Controls.funcionalidad_id "
                                      
    controles_permitidos = Control.select(:ctrl_html_id).distinct.joins(joins_tablas).where("      Permisos.perfil_id = " + perfil_id.to_s +
                                                                                             " AND Funcion_Controls.modelo_id = " + modelo_id.to_s + 
                                                                                             " AND Funcion_Controls.accion_id = " + accion_id.to_s )
  end
  
end
