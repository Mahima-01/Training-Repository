class ApplicationController < ActionController::API

  def not_found
    render json: { error: 'not_found' }
  end
      
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end

=begin
authorize_request function has responsibility for authorizing user requests. 
first, we need to get a token in the header with ‘Authorization’ as a key. 
with this token now we can decode and get the payload value.

We define user_id in the payload. 
You should not include the user credentials data into the payload because 
it will cause security issues, you can include data that is needed to authorize the user.

When performing JsonWebToken.decode function, it will return JWT::DecodeError if there was an error like token was expired, token not valid, token missing, etc. 
After we got user_id from the payload then we will try to find the user by id and assign it into current_user variable, 
If the user does not exist it will return ActiveRecord::RecordNotFound and it will render an error message with HTTP status unauthorized.


=end