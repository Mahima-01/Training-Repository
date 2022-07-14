class User < ApplicationRecord
  mount_uploader :Profile, ProfileUploader    
end

