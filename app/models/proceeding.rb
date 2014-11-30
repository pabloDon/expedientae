class Proceeding < ActiveRecord::Base
  mount_uploader :carta_despido, CartaDespidoUploader
  mount_uploader :cedula_citacion, CedulaCitacionUploader
  mount_uploader :demanda, DemandaUploader
  mount_uploader :finiquito, FiniquitoUploader
  mount_uploader :sentencia, SentenciaUploader
  
end
