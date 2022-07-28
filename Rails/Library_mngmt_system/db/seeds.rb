# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  puts "Creating author #{i+1}"
  Author.create(
    email: "Author #{i+1}",
    gender: "Gender #{i+1}"
  )
end
# require 'faker'

# 8.times do |authors|
#   auth = Author.create(name: Faker::Name.name)
  
#   3.times do |x|
#     auth.books.create(title: Faker::Book.title )
#   end
# end
