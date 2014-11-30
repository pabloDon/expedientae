module ProceedingsHelper
  def nombre_archivo tipo_archivo, objeto
    if tipo_archivo == :carta_despido and objeto.carta_despido.path != nil
      return "<span class='cursiva'> #{File.basename(objeto.carta_despido.path)} </span>".html_safe if tipo_archivo == :carta_despido
    end
    if tipo_archivo == :cedula_citacion and objeto.cedula_citacion.path != nil 
      return "<span class='cursiva'> #{File.basename(objeto.cedula_citacion.path)} </span>".html_safe if tipo_archivo == :cedula_citacion
    end
    if tipo_archivo == :finiquito and objeto.finiquito.path != nil
      return "<span class='cursiva'> #{File.basename(objeto.finiquito.path)} </span>".html_safe if tipo_archivo == :finiquito
    end
    if tipo_archivo == :demanda and objeto.sentencia.path != nil
      return "<span class='cursiva'> #{File.basename(objeto.demanda.path)} </span>".html_safe if tipo_archivo == :demanda
    end
    if tipo_archivo == :sentencia and objeto.sentencia.path != nil
      return "<span class='cursiva'> #{File.basename(objeto.sentencia.path)} </span>".html_safe 
    end
    return ""
  end
end
