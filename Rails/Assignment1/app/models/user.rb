class User < ApplicationRecord
  def self.search(search)
    if search
      user_type = User.find_by(first_name: search)
      if user_type
        self.where(user_id: user_type)
      else 
        @users = User.all  
      end 
    else  
      @users = User.all  
    end 
  end
end
