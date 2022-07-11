require 'json'
require 'rest-client'
require 'open-uri'
=begin
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
=end

#https://reqres.in/api/users/2
url = "https://reqres.in/api/users"
print url,"\n"
response1 = RestClient.post url, {
  "name": "Ria",
  "job": "Name"
}
data_h = JSON.parse(response1)
url = "https://reqres.in/api/users/#{@id}"
response2 = RestClient.get url
print response2.body