class Foto < ActiveRecord::Base
  mount_uploader :foto_nombre, AttachmentUploader
  mount_uploader :foto_mini, AttachmentUploader
end
