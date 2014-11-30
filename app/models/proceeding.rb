class Proceeding < ActiveRecord::Base
  #has_attached_file :carta_despido,
  #  :storage => :dropbox,
  #  :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  #has_attached_file :finiquito,
  #  :storage => :dropbox,
  #  :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  #has_attached_file :cedula_citacion,
  #  :storage => :dropbox,
  #  :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  #has_attached_file :demanda,
  #  :storage => :dropbox,
  #  :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  #has_attached_file :sentencia,
  #  :storage => :dropbox,
  #  :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  #
  #do_not_validate_attachment_file_type :carta_despido
  #do_not_validate_attachment_file_type :finiquito
  #do_not_validate_attachment_file_type :cedula_citacion
  #do_not_validate_attachment_file_type :demanda
  #do_not_validate_attachment_file_type :sentencia
  
  mount_uploader :carta_despido, CartaDespidoUploader
  mount_uploader :cedula_citacion, CedulaCitacionUploader
  mount_uploader :demanda, DemandaUploader
  mount_uploader :finiquito, FiniquitoUploader
  mount_uploader :sentencia, SentenciaUploader
  
end
