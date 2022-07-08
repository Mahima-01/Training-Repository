require 'json'
require 'rest-client'
require 'open-uri'

url = "https://reqres.in/api/users?page=1"
response = RestClient.get(url)
data_h = JSON.parse(response)
print data_h.keys

data_h['data'].each do |user|
  @email = user['email']
  @first_name = user['first_name']
  @last_name = user['last_name']
  @gender = user['gender']
  User.create(email: @email, first_name: @first_name, last_name: @last_name, gender: @gender)
end