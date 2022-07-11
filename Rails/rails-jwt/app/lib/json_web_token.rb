class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end
    
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end

=begin
SECRET_KEY is the key for encoding and decoding tokens.
Every time we’re doing some encoding and decoding using JWT, we need to specify the SECRET_KEY.

self.encode function has 2 parameters. 
first payload and second exp
-Payload is a key-value object for holding data that want to be encoded. 
-exp stand for expiration for holding expiration time token. 
if exp is not specified it will give you the default value in 24 hours or one day.

In self.decode function we decoded the token given by the user and get the first value then assign it to a decoded variable, 
the first value contains a payload that we had already encoded before and the second value contain information about the algorithm that we use for encoding and decoding token.
=end