class User < ApplicationRecord
  mount_uploader :profile, ProfileUploader    
end

