module ApplicationHelper
  def set_estados_registro
    @estados_registro = Catalogo.where("ctlg_categoria = 'ESTADO REGISTRO' AND ctlg_estado_registro = 'A'")
  end
  
    
end
