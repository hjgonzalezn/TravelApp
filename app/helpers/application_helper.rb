module ApplicationHelper
  def set_estados_registro
    @estados_registro = Catalogo.where("ctlg_categoria = 'ESTADO REGISTRO' AND ctlg_estado_registro = 'A'")
  end
  
  def set_modelos
    modelos = Modelo.where(mdl_estado_registro: :A).order(mdl_nombre: :asc)
  end
  
  def set_acciones
    acciones = Accion.where(acc_estado_registro: :A).order(acc_nombre: :asc)
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
